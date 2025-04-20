import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_config_model.g.dart';
part 'app_config_model.freezed.dart';

@freezed
class AppConfigModel with _$AppConfigModel {
  const factory AppConfigModel({
    @Default(true) bool isDarkMode,
    @Default(true) bool turnOnNotification,
    @Default('ar') String language,
  }) = _AppConfigModel;

  factory AppConfigModel.fromJson(Map<String, dynamic> json) =>
      _$AppConfigModelFromJson(json);
}
