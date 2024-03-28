import 'dart:async';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/blocs/inventory_listener.dart';
import 'package:inventory_management/blocs/inventory_report.dart';
import 'package:inventory_management/models/entities/inventory_facility.dart';
import 'package:inventory_management/models/entities/product_variant.dart';
import 'package:inventory_management/models/entities/project_resource.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:inventory_management/models/entities/stock_reconciliation.dart';
import 'package:inventory_management/models/entities/transaction_reason.dart';
import 'package:inventory_management/models/entities/transaction_type.dart';
import 'package:new_digit_app/blocs/facilitiesComposite.dart';
import 'package:new_digit_app/blocs/product_variants_composite.dart';
import 'package:new_digit_app/data/secure_storage/secureStore.dart';
import 'package:new_digit_app/model/dataModel.dart';
import 'package:new_digit_app/model/inventory/stock_reconciliation.dart';
import 'package:new_digit_app/model/stock/stock_model.dart';
import 'package:new_digit_app/model/user/userModel.dart';
import 'package:new_digit_app/repositories/app_init_Repo.dart';
import 'package:new_digit_app/repositories/stock_reconciliation_repo.dart';
import 'package:new_digit_app/repositories/stock_repo.dart';

class HCMInventoryBloc extends InventoryListener {
  BuildContext context;
  final String? userId;
  final String uuid;
  final List<Role>? roles;
  // final String? individualId;
  final String? projectId;
  final Map<DataModelType, Map<ApiOperation, String>>? actionMap;

  HCMInventoryBloc({
    required this.context,
    required this.userId,
    required this.actionMap,
    required this.uuid,
    required this.roles,
    // required this.individualId,
    required this.projectId,
  });

  late Function(bool) _onTriggerDetected = (bool) {};

  //ignore
  @override
  void callSyncMethod() {}

  @override
  Future<List<InventoryFacilityModel>> fetchFacilitiesForProjectId() async {
    try {
      if (roles!
          .map((e) => e.code == 'DISTRICT_SUPERVISOR')
          .toList()
          .isNotEmpty) {
        final facilitiesBloc = context.read<FacilityCompositeBloc>()
          ..add(FacilityCompositeLoadForProjectEvent(
              projectId: projectId!, actionMap: actionMap));

        final facilitiesState = await facilitiesBloc.stream.firstWhere(
            (state) => state.maybeWhen(
                orElse: () => false, fetched: (facilities) => true));

        List<InventoryFacilityModel> hcmInventoryFacilityModel = [];
        facilitiesState.maybeWhen(
          fetched: (facilities) {
            for (var element in facilities) {
              hcmInventoryFacilityModel.add(
                InventoryFacilityModel(
                  id: element.id,
                  isPermanent: element.isPermanent,
                  nonRecoverableError: element.nonRecoverableError,
                  rowVersion: element.rowVersion,
                  storageCapacity: element.storageCapacity,
                  tenantId: element.tenantId,
                  usage: element.usage,
                ),
              );
            }
          },
          orElse: () {},
        );

        return hcmInventoryFacilityModel;
      } else {
        return [];
      }
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  @override
  Future<void> fetchInventoryReports(
      FetchInventoryReports fetchInventoryReports) async {
    final _stockModelsLoaded = fetchInventoryReports.stocks;

    final reportType = fetchInventoryReports.reportType;
    final facilityId = fetchInventoryReports.facilityId;
    final productVariantId = fetchInventoryReports.productVariantId;

    if (reportType == InventoryReportType.reconciliation) {
      throw Exception(
        'Invalid report type: ${fetchInventoryReports.reportType}',
      );
    }

    List<TransactionReason>? transactionReason;
    List<TransactionType>? transactionType;
    String? senderId;
    String? receiverId;

    if (reportType == InventoryReportType.receipt) {
      transactionType = [TransactionType.received];
      transactionReason = [TransactionReason.received];
      receiverId = facilityId;
      senderId = null;
    } else if (reportType == InventoryReportType.dispatch) {
      transactionType = [TransactionType.dispatched];
      transactionReason = [];
      receiverId = null;
      senderId = facilityId;
    } else if (reportType == InventoryReportType.returned) {
      transactionType = [TransactionType.received];
      transactionReason = [TransactionReason.returned];
      receiverId = null;
      senderId = facilityId;
    } else if (reportType == InventoryReportType.damage) {
      transactionType = [TransactionType.dispatched];
      transactionReason = [
        TransactionReason.damagedInStorage,
        TransactionReason.damagedInTransit,
      ];
      receiverId = facilityId;
      senderId = null;
    } else if (reportType == InventoryReportType.loss) {
      transactionType = [TransactionType.dispatched];
      transactionReason = [
        TransactionReason.lostInStorage,
        TransactionReason.lostInTransit,
      ];
      receiverId = facilityId;
      senderId = null;
    }
    final user = await SecureStore().getAccessInfo();

    final data = (receiverId != null
            ? await StockRemoteRepository().search(
                HcmStockSearchModel(
                  stock: StockSearchModel(
                    transactionType: transactionType,
                    tenantId: envConfig.variables.tenantId,
                    receiverId: receiverId,
                    productVariantId: productVariantId,
                    transactionReason: transactionReason,
                  ),
                ),
                actionMap)
            : await StockRemoteRepository().search(
                HcmStockSearchModel(
                  stock: StockSearchModel(
                    transactionType: transactionType,
                    tenantId: envConfig.variables.tenantId,
                    senderId: senderId,
                    productVariantId: productVariantId,
                    transactionReason: transactionReason,
                  ),
                ),
                actionMap))
        .where((element) =>
            element.auditDetails != null &&
            element.auditDetails?.createdBy == user?.userRequest?.uuid);

    final groupedData = data.groupListsBy(
      (element) => DateFormat('dd MMM yyyy').format(
        DateTime.fromMillisecondsSinceEpoch(
          element.auditDetails!.createdTime,
        ),
      ),
    );

    _stockModelsLoaded(groupedData.map((key, value) {
      return MapEntry(key, value.map((e) => e.stock!).toList());
    }));
  }

  @override
  Future<List<ProductVariantModel>> fetchProductVariants() async {
    if (roles!
        .map((e) => e.code == 'DISTRICT_SUPERVISOR')
        .toList()
        .isNotEmpty) {
      //Created a composite class called productVariantCompositeBloc because
      //the Bloc in the inventory package does not make an API call

      final productsBloc = context.read<ProductVariantCompositeBloc>()
        ..add(ProductVariantCompositeLoadEvent(
            query: ProjectResourceSearchModel(
              projectId: projectId!,
            ),
            actionMap: actionMap));

      final productVariantsState = await productsBloc.stream.firstWhere(
        (state) => state.maybeWhen(
          fetched: (productVariants) => true,
          orElse: () => false,
        ),
      );

      List<ProductVariantModel> hcmProductVariantModel = [];
      productVariantsState.maybeWhen(
        fetched: (productVariants) {
          for (var element in productVariants) {
            hcmProductVariantModel.add(
              ProductVariantModel(
                id: element.id,
                variation: element.variation,
                rowVersion: element.rowVersion,
                tenantId: element.tenantId,
                nonRecoverableError: element.nonRecoverableError,
                productId: element.productId,
                sku: element.sku,
              ),
            );
          }
        },
        orElse: () {},
      );

      return hcmProductVariantModel;
    } else {
      return [];
    }
  }

  @override
  Future<void> fetchStockReconciliationDetails(
      FetchStockReconDetails fetchStockReconDetails) async {
    final Iterable<HcmStockModel> sentStocks =
        (await StockRemoteRepository().search(
                HcmStockSearchModel(
                  stock: StockSearchModel(
                      facilityId: fetchStockReconDetails.facilityId,
                      productVariantId:
                          fetchStockReconDetails.productVariantId),
                ),
                actionMap))
            .where((element) =>
                element.auditDetails != null &&
                element.auditDetails?.createdBy == uuid)
            .toList();

    final Iterable<HcmStockModel> receivedStocks =
        (await StockRemoteRepository().search(
                HcmStockSearchModel(
                  stock: StockSearchModel(
                      facilityId: fetchStockReconDetails.facilityId,
                      productVariantId:
                          fetchStockReconDetails.productVariantId),
                ),
                actionMap))
            .where((element) =>
                element.auditDetails != null &&
                element.auditDetails?.createdBy == uuid)
            .toList();

    var received = receivedStocks.map((e) => e.stock!).toList();
    var sent = sentStocks.map((e) => e.stock!).toList();

    fetchStockReconDetails.stockReconDetails(sent, received);
  }

  @override
  Future<void> handleStockReconciliationReport(
      StockReconciliationReport stockReconciliationReport) async {
    final Iterable<HcmStockReconciliationModel> data =
        await StockReconciliationRemoteRepository().search(
            StockReconciliationSearchModel(
                tenantId: envConfig.variables.tenantId,
                facilityId: stockReconciliationReport.facilityId,
                productVariantId: stockReconciliationReport.productVariantId),
            actionMap);

    final groupedData = data
        .groupListsBy((element) =>
            DateFormat('dd MMM yyyy').format(element.dateOfReconciliationTime))
        .map((key, value) {
      return MapEntry(key, value);
    });

    final additionalData = data.map((e) => e.additionalFields).toList();
    var moreDetails = additionalData.map((e) => e?.fields).toList();
    var additionalFields = moreDetails.map((e) => e!.map((e) {
          return MapEntry(e.key, e.value);
        }));
    stockReconciliationReport.stockReconciliationReport(
        groupedData, additionalFields);
  }

  @override
  Future<void> saveStockDetails(SaveStockDetails saveStockDetails) async {
    await StockRemoteRepository().create(
        HcmStockModel(
          stock: saveStockDetails.stockModel.copyWith(
            facilityId: saveStockDetails.stockModel.facilityId,
            rowVersion: 1,
            tenantId: envConfig.variables.tenantId,
          ),
          additionalFields: HcmStockModelAdditionalFields(
            version: 1,
            fields: getAdditionalData(saveStockDetails.additionalData),
          ),
          auditDetails: AuditDetails(
              createdBy: userId.toString(),
              createdTime: DateTime.now().millisecondsSinceEpoch),
          clientAuditDetails: ClientAuditDetails(
            createdBy: userId.toString(),
            createdTime: DateTime.now().millisecondsSinceEpoch,
            lastModifiedBy: userId.toString(),
            lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
          ),
        ),
        actionMap);

    saveStockDetails.isStockSaved(true);
  }

  getAdditionalData(Map<String, Object> additionalData) {
    List<AdditionalField> additionalFields = [];

    additionalData.forEach((key, value) {
      additionalFields.add(AdditionalField(key, value));
    });

    return additionalFields;
  }

  @override
  Future<void> saveStockReconciliationDetails(
      SaveStockReconciliationModel stockReconciliationModel) async {
    await StockReconciliationRemoteRepository().create(
        HcmStockReconciliationModel(
          // stockReconciliation:
          //     stockReconciliationModel.stockReconciliationModel.copyWith(
          tenantId: envConfig.variables.tenantId,
          referenceId: projectId,
          referenceIdType: 'PROJECT',
          clientReferenceId: stockReconciliationModel
              .stockReconciliationModel.clientReferenceId,
          dateOfReconciliation: stockReconciliationModel
              .stockReconciliationModel.dateOfReconciliation,
          additionalFields: StockReconciliationAdditionalFields(
            version: 1,
            fields: getAdditionalData(stockReconciliationModel.additionalData),
          ),

          // auditDetails: AuditDetails(
          //   createdBy: context!.loggedInUserUuid,
          //   createdTime: context!.millisecondsSinceEpoch(),
          // ),
          // clientAuditDetails: ClientAuditDetails(
          //   createdBy: context!.loggedInUserUuid,
          //   createdTime: context!.millisecondsSinceEpoch(),
          //   lastModifiedBy: context!.loggedInUserUuid,
          //   lastModifiedTime: context!.millisecondsSinceEpoch(),
          // ),
        ),
        actionMap);

    stockReconciliationModel.isStockReconciliationSaved(true);
  }

  @override
  void listenToDispose(Function(bool isDisposePackage) disposePackage) {
    _onTriggerDetected = disposePackage;
  }
}
