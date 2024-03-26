import 'dart:async';
import 'package:dio/dio.dart';
import 'package:inventory_management/models/entities/project_resource.dart';
import 'package:new_digit_app/data/remote_client.dart';
import 'package:new_digit_app/model/dataModel.dart';
import 'package:new_digit_app/repositories/app_init_Repo.dart';

class ProjectResourceRemoteRepository {
  ProjectResourceRemoteRepository();

  final dio = DioClient().dio;

  FutureOr<List<ProjectResourceModel>> search(ProjectResourceSearchModel body,
      Map<DataModelType, Map<ApiOperation, String>>? actionMap) async {
    try {
      Response response;
      String searchPath =
          actionMap![DataModelType.projectResource]![ApiOperation.search]!;

      response = await dio.post(
        searchPath,
        queryParameters: {
          'tenantId': envConfig.variables.tenantId,
          'limit': 100,
          'offset': 0
        },
        data: {"ProjectResource": body.toMap()},
      );

      final responseMap = response.data['ProjectResources'];

      final List<ProjectResourceModel> projectResourcesList = [];
      for (final pr in responseMap) {
        projectResourcesList.add(ProjectResourceModelMapper.fromMap(pr));
      }

      return projectResourcesList;
    } catch (err) {
      print(err);
      rethrow;
    }
  }
}
