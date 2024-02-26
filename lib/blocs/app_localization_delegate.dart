import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:new_digit_app/blocs/app_localization.dart';
import 'package:new_digit_app/data/secure_storage/secureStore.dart';
import 'package:new_digit_app/model/appconfig/mdmsResponse.dart';
import 'package:new_digit_app/model/localization/localizationModel.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  final AppConfig? appConfig;

  const AppLocalizationsDelegate(this.appConfig);

  @override
  bool isSupported(Locale locale) {
    return (appConfig!.appConfig?[0].languages)!.map((e) {
      final results = e.value.split('_');
      if (results.isNotEmpty) return results.first;
      return null;
    })
        // .whereNotNull()
        .contains(locale.languageCode);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations appLocalizations = AppLocalizations(locale);
    await appLocalizations.load();
    return appLocalizations;
  }
}
