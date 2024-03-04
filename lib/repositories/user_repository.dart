import 'package:dio/dio.dart';
import 'package:new_digit_app/data/remote_client.dart';
import 'package:new_digit_app/data/secure_storage/secureStore.dart';
import 'package:new_digit_app/model/user/userModel.dart';
import 'package:new_digit_app/utils/constants.dart';

import '../model/request/requestInfo.dart';
import '../utils/envConfig.dart';

class UserRepository {
  UserRepository();

  // Future<UserModel> searchUser(String uuid) async {
  Future<Response> searchUser(String url, String uuid) async {
    // final client = Dio();
    final client = DioClient().dio;

    // fetch the accessToken from secureStore
    final secureStore = SecureStore();
    final authToken = await secureStore.getAccessToken();
    client.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      options.data = {
        ...options.data,
        "RequestInfo": RequestInfoModel(
          apiId: RequestInfoData.apiId,
          ver: RequestInfoData.ver,
          ts: DateTime.now().millisecondsSinceEpoch,
          action: options.path.split('/').last,
          did: RequestInfoData.did,
          key: RequestInfoData.key,
          authToken: authToken,
        ).toJson(),
      };
      return handler.next(options);
    }));

    try {
      final response = await client.post(url,
          queryParameters: {
            'offset': 0,
            'limit': 100,
            'tenantId': envConfig.variables.tenantId,
          },
          data: UserSearchModel(uuid: [uuid]).toMap());

      return response;
    } catch (err) {
      rethrow;
    }
  }

  Future<Response> updateUser(String url, UserModel user) async {
    final client = DioClient().dio;

    // fetch the accessToken from secureStore
    final secureStore = SecureStore();
    final authToken = await secureStore.getAccessToken();

    client.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      options.data = {
        ...options.data,
        "RequestInfo": RequestInfoModel(
          apiId: RequestInfoData.apiId,
          ver: RequestInfoData.ver,
          ts: DateTime.now().millisecondsSinceEpoch,
          action: options.path.split('/').last,
          did: RequestInfoData.did,
          key: RequestInfoData.key,
          authToken: authToken,
        ).toJson(),
      };
      return handler.next(options);
    }));

    final headers = <String, String>{
      "content-type": 'application/x-www-form-urlencoded',
      "Access-Control-Allow-Origin": "*",
      "authorization": "Basic ZWdvdi11c2VyLWNsaWVudDo=",
      "content-length": "0"
    };

    try {
      final response = await client.post(url, queryParameters: {
        'offset': 0,
        'limit': 100,
        'tenantId': envConfig.variables.tenantId,
      }, data: {
        "user": user.toMap()
      });

      // final responseBody = UserModelMapper.fromMap(response.data['user']);
      // return responseBody;

      return response;
    } catch (err) {
      print(err);
      rethrow;
    }
  }
}
