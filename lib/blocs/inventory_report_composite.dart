// import 'dart:async';
// import 'package:collection/collection.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:inventory_management/blocs/inventory_listener.dart';
// import 'package:inventory_management/blocs/inventory_report.dart';
// import 'package:inventory_management/models/entities/stock.dart';
// import 'package:inventory_management/models/entities/stock_reconciliation.dart';
// import 'package:inventory_management/models/entities/transaction_reason.dart';
// import 'package:inventory_management/models/entities/transaction_type.dart';
// import 'package:new_digit_app/data/secure_storage/secureStore.dart';
// import 'package:new_digit_app/model/dataModel.dart';
// import 'package:new_digit_app/model/stock/stock_model.dart';
// import 'package:new_digit_app/repositories/app_init_Repo.dart';
// import 'package:new_digit_app/repositories/stock_reconciliation_repo.dart';
// import 'package:intl/intl.dart';
// import 'package:new_digit_app/repositories/stock_repo.dart';

// part 'inventory_report_composite.freezed.dart';

// typedef InventoryReportEmitter = Emitter<InventoryReportCompositeState>;

// final _inventoryreportBloc = InventoryReportBloc();

// class InventoryReportCompositeBloc
//     extends Bloc<InventoryReportCompositeEvent, InventoryReportCompositeState> {
//   InventoryReportCompositeBloc()
//       : super(const InventoryReportCompositeEmptyState()) {
//     on(_handleLoadDataEvent);
//     on(_handleLoadStockReconciliationDataEvent);
//     on(_handleLoadingEvent);
//   }

//   Future<void> _handleLoadDataEvent(
//     InventoryReportCompositeLoadStockDataEvent event,
//     InventoryReportEmitter emit,
//   ) async {
//     emit(const InventoryReportCompositeLoadingState());
//     final reportType = event.reportType;
//     final facilityId = event.facilityId;
//     final productVariantId = event.productVariantId;

//     List<TransactionReason>? transactionReason;
//     List<TransactionType>? transactionType;
//     String? senderId;
//     String? receiverId;

//     if (reportType == InventoryReportType.receipt) {
//       transactionType = [TransactionType.received];
//       transactionReason = [TransactionReason.received];
//       receiverId = facilityId;
//       senderId = null;
//     } else if (reportType == InventoryReportType.dispatch) {
//       transactionType = [TransactionType.dispatched];
//       transactionReason = [];
//       receiverId = null;
//       senderId = facilityId;
//     } else if (reportType == InventoryReportType.returned) {
//       transactionType = [TransactionType.received];
//       transactionReason = [TransactionReason.returned];
//       receiverId = null;
//       senderId = facilityId;
//     } else if (reportType == InventoryReportType.damage) {
//       transactionType = [TransactionType.dispatched];
//       transactionReason = [
//         TransactionReason.damagedInStorage,
//         TransactionReason.damagedInTransit,
//       ];
//       receiverId = facilityId;
//       senderId = null;
//     } else if (reportType == InventoryReportType.loss) {
//       transactionType = [TransactionType.dispatched];
//       transactionReason = [
//         TransactionReason.lostInStorage,
//         TransactionReason.lostInTransit,
//       ];
//       receiverId = facilityId;
//       senderId = null;
//     }

//     final secureStore = SecureStore();
//     final user = await secureStore.getAccessInfo();

//     // final Iterable<HcmStockModel> data = (receiverId != null
//     //         ? await StockRemoteRepository().search(
//     //             HcmStockSearchModel(
//     //               stock: StockSearchModel(
//     //                 transactionType: transactionType,
//     //                 tenantId: envConfig.variables.tenantId,
//     //                 receiverId: receiverId,
//     //                 productVariantId: productVariantId,
//     //                 transactionReason: transactionReason,
//     //               ),
//     //             ),
//     //             event.actionMap)
//     //         : await StockRemoteRepository().search(
//     //             HcmStockSearchModel(
//     //               stock: StockSearchModel(
//     //                 transactionType: transactionType,
//     //                 tenantId: envConfig.variables.tenantId,
//     //                 senderId: senderId,
//     //                 productVariantId: productVariantId,
//     //                 transactionReason: transactionReason,
//     //               ),
//     //             ),
//     //             event.actionMap))
//     //     .where((element) =>
//     //         element.auditDetails != null &&
//     //         element.auditDetails?.createdBy == user?.userRequest?.uuid);

//     // final groupedData = data.groupListsBy(
//     //   (element) => DateFormat('dd MMM yyyy').format(
//     //     DateTime.fromMillisecondsSinceEpoch(
//     //       element.auditDetails!.createdTime,
//     //     ),
//     //   ),
//     // );

//     // final Iterable<HcmStockModel> senderData =
//     //     await StockRemoteRepository().search(
//     //         HcmStockSearchModel(
//     //           stock: StockSearchModel(
//     //             transactionType: transactionType,
//     //             tenantId: envConfig.variables.tenantId,
//     //             senderId: senderId,
//     //             productVariantId: productVariantId,
//     //             transactionReason: transactionReason,
//     //           ),
//     //         ),
//     //         event.actionMap);

//     // final Iterable<HcmStockModel> receiverData =
//     //     await StockRemoteRepository().search(
//     //         HcmStockSearchModel(
//     //           stock: StockSearchModel(
//     //             transactionType: transactionType,
//     //             tenantId: envConfig.variables.tenantId,
//     //             receiverId: receiverId,
//     //             productVariantId: productVariantId,
//     //             transactionReason: transactionReason,
//     //           ),
//     //         ),
//     //         event.actionMap);

//     _inventoryreportBloc.add(InventoryReportLoadStockDataEvent(
//         reportType: reportType,
//         facilityId: facilityId,
//         productVariantId: productVariantId));

//     // _inventoryreportBloc.emit(InventoryReportState.stock(stockData: groupedData));

//     emit(InventoryReportCompositeStockState(stockData: groupedData));
//   }

//   Future<void> _handleLoadingEvent(
//     InventoryReportCompositeLoadingEvent event,
//     InventoryReportEmitter emit,
//   ) async {
//     emit(const InventoryReportCompositeLoadingState());
//   }

//   Future<void> _handleLoadStockReconciliationDataEvent(
//     InventoryReportCompositeLoadStockReconciliationDataEvent event,
//     InventoryReportEmitter emit,
//   ) async {
//     emit(const InventoryReportCompositeLoadingState());
//     final data = await StockReconciliationRemoteRepository().search(
//         StockReconciliationSearchModel(
//           tenantId: envConfig.variables.tenantId,
//           facilityId: event.facilityId,
//           productVariantId: event.productVariantId,
//         ),
//         event.actionMap);

//     final groupedData = data.groupListsBy(
//       (element) => DateFormat('dd MMM yyyy').format(
//         element.dateOfReconciliationTime,
//       ),
//     );

//     _inventoryreportBloc.add(InventoryReportEvent.loadStockReconciliationData(
//       facilityId: event.facilityId,
//       productVariantId: event.productVariantId,
//     ));

//     emit(InventoryReportCompositeStockReconciliationState(
//       data: groupedData,
//     ));
//   }
// }

// @freezed
// class InventoryReportCompositeEvent with _$InventoryReportCompositeEvent {
//   const factory InventoryReportCompositeEvent.loadStockData(
//           {required InventoryReportType reportType,
//           required String facilityId,
//           required String productVariantId,
//           required Map<DataModelType, Map<ApiOperation, String>>? actionMap}) =
//       InventoryReportCompositeLoadStockDataEvent;

//   const factory InventoryReportCompositeEvent.loadStockReconciliationData({
//     required String facilityId,
//     required Map<DataModelType, Map<ApiOperation, String>>? actionMap,
//     required String productVariantId,
//   }) = InventoryReportCompositeLoadStockReconciliationDataEvent;

//   const factory InventoryReportCompositeEvent.loading() =
//       InventoryReportCompositeLoadingEvent;
// }

// @freezed
// class InventoryReportCompositeState with _$InventoryReportCompositeState {
//   const factory InventoryReportCompositeState.loading() =
//       InventoryReportCompositeLoadingState;
//   const factory InventoryReportCompositeState.empty() =
//       InventoryReportCompositeEmptyState;

//   const factory InventoryReportCompositeState.stock({
//     @Default({}) Map<String, List<HcmStockModel>> stockData,
//   }) = InventoryReportCompositeStockState;

//   const factory InventoryReportCompositeState.stockReconciliation({
//     @Default({}) Map<String, List<StockReconciliationModel>> data,
//   }) = InventoryReportCompositeStockReconciliationState;
// }
