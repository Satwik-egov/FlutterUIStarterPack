import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:new_digit_app/model/appconfig/mdmsResponse.dart';
import 'package:new_digit_app/model/serviceRegistry/serviceRegistryModel.dart';

import '../../model/localization/localizationModel.dart';

class SecureStore {
  final storage = const FlutterSecureStorage();
  SecureStore();

  Future setLocalizations(
      LocalizationModel localizationList, String locale) async {
    String jsonLocalizationList = json.encode(localizationList.toJson());
    await storage.write(key: locale, value: jsonLocalizationList);
  }

  Future<String?> getLocalizations(String locale) async {
    return await storage.read(key: locale);
  }

  Future setAppConfig(MdmsResponseModel mdmsResponseModel) async {
    String jsonMdmsResponse = json.encode(mdmsResponseModel.toJson());
    await storage.write(key: 'appConfig', value: jsonMdmsResponse);
  }

  Future<String?> getAppConfig() async {
    return await storage.read(key: 'appConfig');
  }

  Future setServiceRegistry(ServiceRegistryModel serviceRegistryModel) async {
    String jsonServiceRegistryList = json.encode(serviceRegistryModel.toJson());
    await storage.write(key: 'serviceRegistry', value: jsonServiceRegistryList);
  }

  Future<String?> getServiceRegistry() async {
    return await storage.read(key: 'serviceRegistry');
  }
}
