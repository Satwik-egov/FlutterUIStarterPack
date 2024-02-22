// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responsemodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseModelImpl _$$ResponseModelImplFromJson(Map<String, dynamic> json) =>
    _$ResponseModelImpl(
      access_token: json['access_token'] as String,
      token_type: json['token_type'] as String?,
      refresh_token: json['refresh_token'] as String?,
      scope: json['scope'] as String?,
    );

Map<String, dynamic> _$$ResponseModelImplToJson(_$ResponseModelImpl instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'token_type': instance.token_type,
      'refresh_token': instance.refresh_token,
      'scope': instance.scope,
    };
