import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:new_digit_app/data/secure_storage/secureStore.dart';
import 'package:new_digit_app/model/appconfig/mdmsRequest.dart';
import 'package:new_digit_app/model/appconfig/mdmsResponse.dart';
import 'package:new_digit_app/model/serviceRegistry/serviceRegistryModel.dart';
import 'package:new_digit_app/utils/constants.dart';

import '../model/request/requestInfo.dart';
import '../utils/envConfig.dart';

EnvironmentConfiguration envConfig = EnvironmentConfiguration.instance;

class AppInitRepo {
  Future<MdmsResponseModel> searchAppConfiguration(
      MdmsRequestModel mdmsRequestBody) async {
    final client = Dio();
    final body = mdmsRequestBody.toJson();

    // const FlutterSecureStorage storage = FlutterSecureStorage();
    final SecureStore storage = SecureStore();

    // try to fetch locally
    String? localAppConfig = await storage.getAppConfig();
    if (localAppConfig != null) {
      return MdmsResponseModel.fromJson(json.decode(localAppConfig));
    }

    final headers = <String, String>{
      // "content-type": 'application/x-www-form-urlencoded',
      "Access-Control-Allow-Origin": "*",
      "authorization": "Basic ZWdvdi11c2VyLWNsaWVudDo=",
    };

    try {
      client.interceptors.add(InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) {
        options.data = {
          ...options.data,
          "RequestInfo": RequestInfoModel(
            apiId: RequestInfoData.apiId,
            ver: RequestInfoData.ver,
            ts: DateTime.now().millisecondsSinceEpoch,
            action: options.path.split('/').last,
            did: RequestInfoData.did,
            key: RequestInfoData.key,
          ).toJson(),
        };
        return handler.next(options);
      }));

      final response = await client.post(
          // 'https://unified-dev.digit.org/egov-mdms-service/v1/_search',
          envConfig.variables.completeMdmsApiUrl,
          data: body,
          options: Options(headers: headers));

      final responseBody = MdmsResponseModel.fromJson(
        json.decode(response.toString())['MdmsRes'],
      );

      // storage.write(key: 'app_config', value: response.data.toString());
      storage.setAppConfig(responseBody);

      return responseBody;
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<ServiceRegistryModel> searchServiceRegistry(
    // String apiEndPoint,
    Map<String, dynamic> body,
  ) async {
    final SecureStore storage = SecureStore();

    // try to fetch locally
    String? localServiceRegistry = await storage.getServiceRegistry();
    if (localServiceRegistry != null) {
      return ServiceRegistryModel.fromJson(json.decode(localServiceRegistry));
    }

    //fetch from the mdms
    final client = Dio();

    final headers = <String, String>{
      "Access-Control-Allow-Origin": "*",
      "authorization": "Basic ZWdvdi11c2VyLWNsaWVudDo=",
    };

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

      final response = await client.post(envConfig.variables.completeMdmsApiUrl,
          data: body, options: Options(headers: headers));

      final responseBody = ServiceRegistryModel.fromJson(
          json.decode(response.toString())['MdmsRes']);

      // storage.write(key: 'service_register', value: response.data.toString());
      storage.setServiceRegistry(responseBody);

      return responseBody;
    } catch (_) {
      rethrow;
    }
  }
}
