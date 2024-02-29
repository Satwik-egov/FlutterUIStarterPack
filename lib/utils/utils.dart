import 'package:new_digit_app/blocs/app_init.dart';
import 'package:new_digit_app/data/app_shared_preferences.dart';

getSelectedLanguage(Initialized state, int index) {
  if (AppSharedPreferences().getSelectedLocale == null) {
    AppSharedPreferences().setSelectedLocale(
        state.appConfig.appConfig!.appConfig![0].languages.last.value);
  }
  final selectedLanguage = AppSharedPreferences().getSelectedLocale;
  final isSelected =
      state.appConfig.appConfig!.appConfig![0].languages[index].value ==
          selectedLanguage;

  return isSelected;
}
