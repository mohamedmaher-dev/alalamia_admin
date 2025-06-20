export 'app_config_model.dart';
import 'package:alalamia_admin/core/config/app_config_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

/// Application configuration cubit that manages user preferences and settings
/// Extends HydratedCubit to automatically persist state to local storage
/// Handles theme mode, language, and notification preferences
class AppConfig extends HydratedCubit<AppConfigModel> {
  /// Initialize with default configuration values
  AppConfig() : super(const AppConfigModel());

  /// Toggle between Arabic and English languages
  /// Switches from 'ar' to 'en' and vice versa
  void changeLanguage() => emit(state.copyWith(language: _getNewLanguage()));

  /// Toggle between light and dark theme modes
  void changeTheme() => emit(state.copyWith(isDarkMode: !state.isDarkMode));

  /// Update notification preference setting
  /// [value] - true to enable notifications, false to disable
  void changeTurnOnNotification({required final bool value}) =>
      emit(state.copyWith(turnOnNotification: value));

  /// Deserialize configuration from JSON storage
  /// Called automatically by HydratedBloc to restore previous state
  @override
  AppConfigModel? fromJson(final Map<String, dynamic> json) =>
      AppConfigModel.fromJson(json);

  /// Serialize configuration to JSON for storage
  /// Called automatically by HydratedBloc to persist current state
  @override
  Map<String, dynamic>? toJson(final AppConfigModel model) => model.toJson();

  /// Helper method to determine the new language when toggling
  /// Returns 'en' if current is 'ar', otherwise returns 'ar'
  String _getNewLanguage() => state.language == 'ar' ? 'en' : 'ar';
}
