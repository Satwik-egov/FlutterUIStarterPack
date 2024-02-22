import 'package:new_digit_app/model/localization/localizationModel.dart';

class LocalizationHelper {
  static String translate(String code, LocalizationModel localizationModel) {
    final message = localizationModel.messages.firstWhere(
      (message) => message.code == code,
      orElse: () => LocalizationMessageModel(
          // code: code, message: code, module: '', locale: ''),
          code: code,
          message: 'message_mapping_error',
          module: '',
          locale: ''),
    );
    return message.message;
  }
}
