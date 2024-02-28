import 'package:dio/dio.dart';
import 'package:new_digit_app/data/secure_storage/secureStore.dart';
import 'package:new_digit_app/model/user/userModel.dart';

import '../model/request/requestInfo.dart';
import '../utils/envConfig.dart';

class UserRepository {
  UserRepository();

  Future<UserModel> searchUser(String uuid) async {
    final client = Dio();

    //fetch the accessToken from secureStore
    final secureStore = SecureStore();
    final authToken = await secureStore.getAccessToken();

    client.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      options.data = {
        ...options.data,
        "RequestInfo": RequestInfoModel(
          apiId: 'hcm',
          ver: '0.1',
          ts: DateTime.now().millisecondsSinceEpoch,
          action: options.path.split('/').last,
          did: "1",
          key: "1",
          authToken: authToken,
        ).toJson(),
      };
      return handler.next(options);
    }));

    try {
      final response =
          await client.post("https://unified-dev.digit.org/user/v1/_search",
              queryParameters: {
                'tenantId': envConfig.variables.tenantId,
              },
              data: uuid);
      final responseBody = UserModelMapper.fromJson(response.data);
      return responseBody;
    } catch (err) {
      print(err);
      rethrow;
    }
  }
}
