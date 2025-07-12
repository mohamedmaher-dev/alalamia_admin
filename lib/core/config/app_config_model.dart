import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_config_model.g.dart';
part 'app_config_model.freezed.dart';

/// App configuration model containing both static developer settings and user preferences
/// This class uses Freezed for immutable data generation with JSON serialization support
@freezed
class AppConfigModel with _$AppConfigModel {
  /// Controls whether users can hide items from their cart view
  static bool canHideCartItem = false;

  /// Determines whether main navigation pages should maintain their state when switching tabs
  /// When true, pages preserve their scroll position and form data during tab navigation
  static bool maintainStateMainPages = true;

  /// Determines whether the app should automatically log in the user when the app is opened
  /// When true, the app will automatically log in the user when the app is opened
  static bool autoLogin = true;

  /// Factory constructor for creating app configuration instances
  ///
  /// [isDarkMode] - Controls dark/light theme preference (defaults to dark theme)
  /// [turnOnNotification] - Enables or disables push notifications (defaults to enabled)
  /// [language] - Sets the application language ('ar' for Arabic, 'en' for English, defaults to Arabic)
  const factory AppConfigModel({
    @Default(true) final bool isDarkMode,
    @Default(true) final bool turnOnNotification,
    @Default('ar') final String language,
  }) = _AppConfigModel;

  /// Factory constructor for JSON deserialization
  /// Converts stored configuration data back into AppConfigModel instance
  factory AppConfigModel.fromJson(final Map<String, dynamic> json) =>
      _$AppConfigModelFromJson(json);
}
