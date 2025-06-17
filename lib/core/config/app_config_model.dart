import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_config_model.g.dart';
part 'app_config_model.freezed.dart';

/// Application configuration model that holds user preferences and app settings
/// Uses Freezed for immutable data class generation with built-in JSON serialization
@freezed
class AppConfigModel with _$AppConfigModel {
  /// Creates an AppConfigModel with default values
  ///
  /// [isDarkMode] - Whether the app should use dark theme (default: true)
  /// [turnOnNotification] - Whether notifications are enabled (default: true)
  /// [language] - Current app language code, supports 'ar' and 'en' (default: 'ar')
  const factory AppConfigModel({
    @Default(true) final bool isDarkMode,
    @Default(true) final bool turnOnNotification,
    @Default('ar') final String language,
  }) = _AppConfigModel;

  /// Creates an AppConfigModel instance from JSON data
  /// Used for deserializing saved configuration from local storage
  factory AppConfigModel.fromJson(final Map<String, dynamic> json) =>
      _$AppConfigModelFromJson(json);
}
