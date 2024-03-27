import 'dart:async';
import 'package:dio/dio.dart';
import 'package:inventory_management/models/entities/stock_reconciliation.dart';
import 'package:new_digit_app/data/remote_client.dart';
import 'package:new_digit_app/model/dataModel.dart';
import 'package:new_digit_app/model/inventory/stock_reconciliation.dart';
import 'package:new_digit_app/repositories/app_init_Repo.dart';

class StockReconciliationRemoteRepository {
  StockReconciliationRemoteRepository();

  final dio = DioClient().dio;

  FutureOr<List<HcmStockReconciliationModel>> search(
      StockReconciliationSearchModel body,
      Map<DataModelType, Map<ApiOperation, String>>? actionMap) async {
    try {
      Response response;
      String searchPath =
          actionMap![DataModelType.stockReconciliation]![ApiOperation.search]!;

      response = await dio.post(
        searchPath,
        queryParameters: {
          'tenantId': envConfig.variables.tenantId,
          'limit': 100,
          'offset': 0
        },
        data: {"StockReconciliation": body.toMap()},
      );

      final responseMap = response.data['StockReconciliation'];

      List<HcmStockReconciliationModel> stockReconciliationList = [];
      for (final staff in responseMap) {
        stockReconciliationList
            .add(HcmStockReconciliationModelMapper.fromMap(staff));
      }

      return stockReconciliationList;
    } catch (err) {
      rethrow;
    }
  }
}
