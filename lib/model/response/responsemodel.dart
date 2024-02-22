import 'package:freezed_annotation/freezed_annotation.dart';

part 'responsemodel.freezed.dart';

part 'responsemodel.g.dart';

@freezed
class ResponseModel with _$ResponseModel {
  const factory ResponseModel({
    required String access_token,
    required String? token_type,
    required String? refresh_token,
    required String? scope,
  }) = _ResponseModel;

  factory ResponseModel.fromJson(Map<String, Object?> json) =>
      _$ResponseModelFromJson(json);
}
