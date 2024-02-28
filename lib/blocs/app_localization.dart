import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:new_digit_app/blocs/app_localization_delegate.dart';
import '../data/secure_storage/secureStore.dart';
import '../model/appconfig/mdmsResponse.dart';
import '../model/localization/localizationModel.dart';
import 'localization.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static LocalizationModel? localizationModel;

  static late List<LocalizationMessageModel> _localizedStrings =
      <LocalizationMessageModel>[];

  static LocalizationsDelegate<AppLocalizations> getDelegate(
    AppConfig config,
  ) =>
      AppLocalizationsDelegate(config);

  // Future<bool> load() async {
  Future<LocalizationModel?> load() async {
    //implementing using secure store
    final secureStore = SecureStore();
    final jsonlocString = await secureStore
        .getLocalizations('${locale.languageCode}_${locale.countryCode}');
    if (jsonlocString != null) {
      final Map<String, dynamic> jsonMap = json.decode(jsonlocString);
      localizationModel = LocalizationModel.fromJson(jsonMap);
      //////////////
      _localizedStrings = localizationModel?.messages ?? [];
      /////////////
    }
    return localizationModel;
  }

  // String translate(String code) {
  //   // final message = localizationModel?.messages.firstWhere(
  //     final  message = _localizedStrings.firstWhere(
  //     (message) => message.code == code,
  //     orElse: () => LocalizationMessageModel(
  //         code: code, message: '${code}', module: '', locale: ''),
  //   );
  //   return message?.message ?? code;
  // }

  String translate(String localizedValues) {
    if (_localizedStrings.isEmpty) {
      return localizedValues;
    } else {
      final index = _localizedStrings.indexWhere(
        (medium) => medium.code == localizedValues,
      );

      return index != -1 ? _localizedStrings[index].message : localizedValues;
    }
  }
}
