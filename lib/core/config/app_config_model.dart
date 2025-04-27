import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_config_model.g.dart';
part 'app_config_model.freezed.dart';

@freezed
class AppConfigModel with _$AppConfigModel {
  const factory AppConfigModel({
    @Default(true) final bool isDarkMode,
    @Default(true) final bool turnOnNotification,
    @Default('ar') final String language,
  }) = _AppConfigModel;

  factory AppConfigModel.fromJson(final Map<String, dynamic> json) =>
      _$AppConfigModelFromJson(json);
}
