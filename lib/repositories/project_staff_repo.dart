import 'dart:async';

import 'package:dio/dio.dart';
import 'package:new_digit_app/data/remote_client.dart';
import 'package:new_digit_app/model/dataModel.dart';
import 'package:new_digit_app/model/project_staff/project_staff.dart';
import 'package:new_digit_app/repositories/app_init_Repo.dart';

class ProjectStaffRemoteRepository {
  ProjectStaffRemoteRepository();

  final dio = DioClient().dio;

  FutureOr<List<ProjectStaffModel>> searchStaff(ProjectStaffSearchModel body,
      Map<DataModelType, Map<ApiOperation, String>>? actionMap) async {
    try {
      Response response;
      String searchPath =
          actionMap![DataModelType.projectStaff]![ApiOperation.search]!;

      response = await dio.post(
        searchPath,
        queryParameters: {
          'tenantId': envConfig.variables.tenantId,
          'limit': 100,
          'offset': 0
        },
        data: {"Individual": body.toMap()},
      );

      final responseMap = (response.data);

      return responseMap;
    } catch (err) {
      rethrow;
    }
  }
}
