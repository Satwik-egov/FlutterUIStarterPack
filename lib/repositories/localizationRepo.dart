import 'package:dio/dio.dart';

import '../model/localization/localizationModel.dart';
import '../model/request/requestInfo.dart';

class LocalizationRepository {
  final client = Dio();

  Future<LocalizationModel> getLocalizationsList(
      Map<String, String> queryParameters) async {
    try {
      client.interceptors.add(InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) {
        options.data = {
          ...options.data,
          "RequestInfo": RequestInfoModel(
            apiId: 'hcm',
            ver: '0.1',
            ts: DateTime.now().millisecondsSinceEpoch,
            action: options.path.split('/').last,
            did: "1",
            key: "1",
            // authToken: authToken,
          ).toJson(),
        };
        return handler.next(options);
      }));
      final response = await client.post(
          'https://unified-dev.digit.org/localization/messages/v1/_search',
          // queryParameters: {"locale": "", "module": []},
          queryParameters: queryParameters,
          data: {});

      // final responseBody =
      //     LocalizationModel.fromJson(response.data['messages']);

      final responseBody = LocalizationModel.fromJson(response.data);

      // final responseBody = LocalizationModel(messages: message);

      return responseBody;
    } catch (err) {
      rethrow;
    }
  }
}
