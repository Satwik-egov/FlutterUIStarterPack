import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_digit_app/data/secure_storage/secureStore.dart';
import 'package:new_digit_app/repositories/localizationRepo.dart';

import '../model/appconfig/mdmsResponse.dart';
import '../model/localization/localizationModel.dart';

part 'localization.freezed.dart';

class Localization extends Bloc<LocalizationEvent, LocalizationState> {
  late LocalizationModel localizationsList;
  // late String? locale;
  Localization() : super(LocalizationState.initial()) {
    on<_LocaleSelectedEvent>(onLocaleSelected);
  }

  FutureOr<void> onLocaleSelected(
      _LocaleSelectedEvent event, Emitter<LocalizationState> emit) async {
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

      final Map<String, String> queryParam = {
        'locale': event.locale.toString(),
        // 'modules': event.moduleList.toString(),
        'module': moduleNameList.join(','),
        'tenantId': 'mz'
      };

      //fetch localizationModel from mdms
      final localizationsList =
          await localizationRepository.getLocalizationsList(queryParam);

      print(localizationsList);
      final secureStore = SecureStore();
      secureStore.setLocalizations(localizationsList);

      emit(LocalizationState.selected(localizationModel: localizationsList));

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
      {required LocalizationModel localizationModel}) = _LocaleSelectedState;
}
