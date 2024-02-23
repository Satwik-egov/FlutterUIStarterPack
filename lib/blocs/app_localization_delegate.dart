import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:new_digit_app/data/secure_storage/secureStore.dart';
import 'package:new_digit_app/model/localization/localizationModel.dart';

class AppLocalizationsDelegate
    extends LocalizationsDelegate<LocalizationModel> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    throw UnimplementedError();
  }

  @override
  Future<LocalizationModel> load(Locale locale) async {
    //implementing using secure store
    final secureStore = SecureStore();
    final locString = await secureStore.getLocalizations();
    final Map<String, dynamic> jsonMap = json.decode(locString!);
    return LocalizationModel.fromJson(jsonMap);

    //implementing using isar

    // throw UnimplementedError();
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
