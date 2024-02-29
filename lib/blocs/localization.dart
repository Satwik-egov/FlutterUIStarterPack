import 'dart:async';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_digit_app/blocs/app_localization.dart';
import 'package:new_digit_app/data/secure_storage/secureStore.dart';
import 'package:new_digit_app/repositories/localizationRepo.dart';

import '../model/appconfig/mdmsResponse.dart';
import '../model/localization/localizationModel.dart';

part 'localization.freezed.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  // late LocalizationModel localizationsList;
  late LocalizationModel localizationList;
  String? _locale;

  LocalizationBloc() : super(LocalizationState.initial()) {
    on<_LocaleSelectedEvent>(onLocaleSelected);
  }

  String? get locale => _locale;
  LocalizationModel? get getLocalizationModel => localizationList;

  FutureOr<void> onLocaleSelected(
      _LocaleSelectedEvent event, Emitter<LocalizationState> emit) async {
    //make sure we can access the locale in the bloc using a getter
    _locale = event.locale;

    //Search for localizations
    try {
      final localizationRepository = LocalizationRepository();

      List<String?> moduleNameList = [];
      if (event.moduleList != null) {
        for (var list in event.moduleList!.interfaces!) {
          if (!list.name!.contains(RegExp(r'[A-Z]'))) {
            moduleNameList.add(list.name);
          }
          // moduleNameList.add(list.name);
        }
      }
      final secureStore = SecureStore();

      final Map<String, String> queryParam = {
        'locale': event.locale.toString(),
        'module': moduleNameList.join(','),
        'tenantId': 'mz'
      };

      //initialize appLocalizations for searching secure storage or setting locmodel
      final splitLocale = event.locale!.split('_');
      AppLocalizations appLocalizations =
          AppLocalizations(Locale(splitLocale[0], splitLocale[1]));

      //attempt to fetch from secure storage
      var localizationsList = await appLocalizations.load();

      //fetch localizationList online
      if (localizationsList == null) {
        localizationsList =
            await localizationRepository.getLocalizationsList(queryParam);

        //once we have the localizations from the server, we can save them locally
        //pushing to storage for future access
        secureStore.setLocalizations(localizationsList, event.locale!);
      }

      //first setting the localization model so that we can have access to it in the translate method
      // appLocalizations.setLocalizationModel = localizationsList;

      //Change the bloc to make it not necessary to take a localizationsList
      emit(LocalizationState.selected(
          locale: event.locale, localizationModel: localizationsList));

      //trying to pass state variable locale
      // locale = event.locale.toString();
    } catch (err) {
      print(err);
      rethrow;
    }
  }
}

@freezed
class LocalizationEvent with _$LocalizationEvent {
  const factory LocalizationEvent.onSelect(
      {String? locale, InterfacesList? moduleList}) = _LocaleSelectedEvent;
}

@freezed
class LocalizationState with _$LocalizationState {
  const factory LocalizationState.initial() = _LocaleNotSelectedState;
  const factory LocalizationState.selected(
      {required String? locale,
      required LocalizationModel localizationModel}) = _LocaleSelectedState;
}
