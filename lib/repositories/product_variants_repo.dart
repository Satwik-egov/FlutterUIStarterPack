import 'dart:async';
import 'package:dio/dio.dart';
import 'package:inventory_management/models/entities/product_variant.dart';
import 'package:new_digit_app/data/remote_client.dart';
import 'package:new_digit_app/model/dataModel.dart';
import 'package:new_digit_app/model/entities/project_facility.dart';
import 'package:new_digit_app/repositories/app_init_Repo.dart';

class ProductVariantRemoteRepository {
  ProductVariantRemoteRepository();

  final dio = DioClient().dio;

  FutureOr<List<ProductVariantModel>> search(ProductVariantSearchModel body,
      Map<DataModelType, Map<ApiOperation, String>>? actionMap) async {
    try {
      Response response;
      String searchPath =
          actionMap![DataModelType.productVariant]![ApiOperation.search]!;

      response = await dio.post(
        searchPath,
        queryParameters: {
          'tenantId': envConfig.variables.tenantId,
          'limit': 100,
          'offset': 0
        },
        data: {"ProductVariant": body.toMap()},
      );

      final responseMap = response.data['ProductVariant'];

      final List<ProductVariantModel> projectResourcesList = [];
      for (final pr in responseMap) {
        projectResourcesList.add(ProductVariantModelMapper.fromMap(pr));
      }

      return projectResourcesList;
    } catch (err) {
      rethrow;
    }
  }
}
