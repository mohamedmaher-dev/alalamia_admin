// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppConfigModelImpl _$$AppConfigModelImplFromJson(Map<String, dynamic> json) =>
    _$AppConfigModelImpl(
      isDarkMode: json['isDarkMode'] as bool? ?? true,
      turnOnNotification: json['turnOnNotification'] as bool? ?? true,
      language: json['language'] as String? ?? 'ar',
    );

Map<String, dynamic> _$$AppConfigModelImplToJson(
  _$AppConfigModelImpl instance,
) => <String, dynamic>{
  'isDarkMode': instance.isDarkMode,
  'turnOnNotification': instance.turnOnNotification,
  'language': instance.language,
};
