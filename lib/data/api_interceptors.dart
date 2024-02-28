import 'package:dio/dio.dart';
import 'package:new_digit_app/data/secure_storage/secureStore.dart';

import '../model/request/requestInfo.dart';

class AuthTokenInterceptor extends Interceptor {
  Future<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final secureStore = SecureStore();

    final authToken = await secureStore.getAccessToken();
    if (options.data is Map) {
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
    }
    super.onRequest(options, handler);
  }
}
