part of 'settings_cubit.dart';

/// State management for settings screen functionality
/// Handles different states during settings operations like theme changes,
/// notification updates, language changes, and user sign out
@freezed
class SettingsState with _$SettingsState {
  /// Initial state containing the current app configuration
  /// [appConfigModel] - Current app configuration with user preferences
  const factory SettingsState.initial({
    required final AppConfigModel appConfigModel,
  }) = _Initial;

  /// Loading state during settings operations (sign out, notification changes)
  const factory SettingsState.loading() = _Loading;

  /// Failure state when a settings operation fails
  /// [e] - The error that occurred during the operation
  const factory SettingsState.failure(final AppError e) = _Failure;
}
