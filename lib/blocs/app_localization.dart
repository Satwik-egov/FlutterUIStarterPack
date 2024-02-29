import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:new_digit_app/blocs/app_localization_delegate.dart';
import 'package:new_digit_app/data/nosql/localization.dart';
import '../data/secure_storage/secureStore.dart';
import '../model/appconfig/mdmsResponse.dart';
import '../model/localization/localizationModel.dart';

class AppLocalizations {
  final Locale locale;
  final Isar isar;

  AppLocalizations(this.locale, this.isar);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static LocalizationModel? localizationModel;

  // static List<LocalizationMessageModel> _localizedStrings =
  //     <LocalizationMessageModel>[];
  static final List<Localization> _localizedStrings = <Localization>[];

  static LocalizationsDelegate<AppLocalizations> getDelegate(
          AppConfig config, Isar isar) =>
      AppLocalizationsDelegate(config, isar);

  Future<bool> load() async {
    // Future<LocalizationModel?> load() async {
    //implementing using secure store
    // final secureStore = SecureStore();
    // final jsonlocString = await secureStore
    //     .getLocalizations('${locale.languageCode}_${locale.countryCode}');
    // if (jsonlocString != null) {
    //   final Map<String, dynamic> jsonMap = json.decode(jsonlocString);
    //   localizationModel = LocalizationModel.fromJson(jsonMap);
    //   _localizedStrings = localizationModel?.messages ?? [];
    // }
    // return localizationModel;

    //implementing using ISAR
    _localizedStrings.clear();
    final List<LocalizationWrapper> localizationList = await isar
        .localizationWrappers
        .filter()
        .localeEqualTo('${locale.languageCode}_${locale.countryCode}')
        .findAll();

    if (localizationList.isNotEmpty) {
      _localizedStrings.addAll(localizationList.first.localization!);
      return true;
    }

    return false;
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
