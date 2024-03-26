import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/blocs/inventory_listener.dart';
import 'package:inventory_management/models/entities/inventory_facility.dart';
import 'package:inventory_management/models/entities/product_variant.dart';
import 'package:inventory_management/models/entities/project_resource.dart';
import 'package:new_digit_app/blocs/facilitiesComposite.dart';
import 'package:new_digit_app/blocs/inventory_report_composite.dart';
import 'package:new_digit_app/blocs/product_variants_composite.dart';
import 'package:new_digit_app/model/dataModel.dart';
import 'package:new_digit_app/model/facilities/facility.dart';
import 'package:new_digit_app/model/stock/stock_model.dart';
import 'package:new_digit_app/model/user/userModel.dart';
import 'package:new_digit_app/repositories/app_init_Repo.dart';
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

  late Function(List<InventoryFacilityModel> facilities) _facilitiesLoaded;
  late Function(List<ProductVariantModel> productVariants)
      _productVariantsLoaded;

  //ignore
  @override
  void callSyncMethod() {}

  @override
  Future<void> fetchFacilitiesForProjectId(
      Function(List<InventoryFacilityModel> facilitiesModel) facilities) {
    _facilitiesLoaded = facilities;

    return fetchFacilities();
  }

  Future<void> fetchFacilities() async {
    if (roles!
        .map((e) => e.code == 'DISTRICT_SUPERVISOR')
        .toList()
        .isNotEmpty) {
      final facilities = context.read<FacilityCompositeBloc>()
        ..add(FacilityCompositeLoadForProjectEvent(
            projectId: projectId!, actionMap: actionMap));

      facilities.state.whenOrNull(
            fetched: (facilities) {
              _facilitiesLoaded(loadInventoryFacilities(facilities));
            },
          ) ??
          [];
    }
  }

  loadInventoryFacilities(List<FacilityModel> facilities) {
    List<InventoryFacilityModel> hcmInventoryFacilityModel = [];
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

    return hcmInventoryFacilityModel;
  }

  @override
  Future<void> fetchInventoryReports(
      FetchInventoryReports fetchInventoryReports) async {
    context.read<InventoryReportCompositeBloc>().add(
        InventoryReportCompositeLoadStockDataEvent(
            reportType: fetchInventoryReports.reportType,
            facilityId: fetchInventoryReports.facilityId,
            productVariantId: fetchInventoryReports.productVariantId,
            actionMap: actionMap));
  }

  @override
  Future<void> fetchProductVariants(
      Function(List<ProductVariantModel> productVariantsModel)
          productVariants) {
    _productVariantsLoaded = productVariants;
    return fetchProducts();
  }

  Future<void> fetchProducts() async {
    // for (final projectStaff in projectStaffList) {
    if (roles!
        .map((e) => e.code == 'DISTRICT_SUPERVISOR')
        .toList()
        .isNotEmpty) {
      //Created a composite class called productVariantCompositeBloc because
      //the Bloc in the inventory package does not make an API call

      final products = context.read<ProductVariantCompositeBloc>()
        ..add(ProductVariantCompositeLoadEvent(
            query: ProjectResourceSearchModel(
              projectId: projectId!,
            ),
            actionMap: actionMap));

      products.state.whenOrNull(
            fetched: (productVariants) {
              _productVariantsLoaded(loadProductVariants(productVariants));
            },
          ) ??
          [];
    }
  }

  List<ProductVariantModel> loadProductVariants(
    List<ProductVariantModel> productVariants,
  ) {
    List<ProductVariantModel> hcmProductVariantModel = [];

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

    return hcmProductVariantModel;
  }

  @override
  Future<void> fetchStockReconciliationDetails(
      FetchStockReconDetails fetchStockReconDetails) async {
    context.read<InventoryReportCompositeBloc>().add(
        InventoryReportCompositeEvent.loadStockReconciliationData(
            facilityId: fetchStockReconDetails.facilityId,
            actionMap: actionMap,
            productVariantId: fetchStockReconDetails.productVariantId));
  }

  @override
  Future<void> handleStockReconciliationReport(
      StockReconciliationReport stockReconciliationReport) {
    // TODO: implement handleStockReconciliationReport
    throw UnimplementedError();
  }

  @override
  Future<void> saveStockDetails(SaveStockDetails saveStockDetails) async {
    final stockRemoteRepository = StockRemoteRepository();

    var response = await stockRemoteRepository.create(
        HcmStockModel(
          stock: saveStockDetails.stockModel.copyWith(
            facilityId: saveStockDetails.stockModel.facilityId,
            rowVersion: 1,
            tenantId: envConfig.variables.tenantId,
          ),
          // additionalFields: StockAdditionalFields(
          //   version: 1,
          //   fields: getAdditionalData(saveStockDetails.additionalData),
          // ),
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
  }

  @override
  Future<void> saveStockReconciliationDetails(
      SaveStockReconciliationModel stockReconciliationModel) {
    // TODO: implement saveStockReconciliationDetails
    throw UnimplementedError();
  }
}
