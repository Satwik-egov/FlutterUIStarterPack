import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_digit_app/blocs/app_localization_delegate.dart';
import 'package:new_digit_app/blocs/localization.dart';
import 'package:new_digit_app/repositories/localizationRepo.dart';
import 'package:new_digit_app/utils/constants.dart';

import '../data/secure_storage/secureStore.dart';
import '../model/appconfig/mdmsResponse.dart';
import '../model/localization/localizationModel.dart';

class AppLocalizations {
  final Locale locale;
  LocalizationModel? localizationModel;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

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
      return localizationModel;
    }
    // else {
    //   localizationModel =
    //       BlocProvider.of<Localization>(scaffoldMessengerKey.currentContext)
    //           .state
    //           .maybeWhen(
    //               orElse: () {
    //                 return null;
    //               },
    //               selected: (locale, localization) => localization);
    //   return localizationModel;
    // }
  }

  String translate(String code) {
    final message = localizationModel!.messages.firstWhere(
      (message) => message.code == code,
      orElse: () => LocalizationMessageModel(
          code: code, message: '${code}_message', module: '', locale: ''),
    );
    return message.message;
  }
}
