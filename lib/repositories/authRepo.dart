import 'package:dio/dio.dart';
import 'package:new_digit_app/model/login/loginModel.dart';
import 'package:new_digit_app/model/response/responsemodel.dart';

class AuthRepository {
  AuthRepository();

  Future<ResponseModel> validateLogin(LoginModel body) async {
    final client = Dio();
    final formData = body.toJson();

    final headers = <String, String>{
      "content-type": 'application/x-www-form-urlencoded',
      "Access-Control-Allow-Origin": "*",
      "authorization": "Basic ZWdvdi11c2VyLWNsaWVudDo=",
    };

    try {
      final response = await client.post(
          "https://unified-qa.digit.org/user/oauth/token",
          data: formData,
          options: Options(headers: headers));

      final responseBody = ResponseModel.fromJson(response.data);
      return responseBody;
    } catch (err) {
      rethrow;
    }
  }
}
