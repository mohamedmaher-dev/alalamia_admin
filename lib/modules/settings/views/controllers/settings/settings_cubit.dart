import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/errors/app_error.dart';
import 'package:alalamia_admin/core/notifications/notifications_repo.dart';
import 'package:alalamia_admin/core/notifications/notifications_service.dart';
import 'package:alalamia_admin/core/router/app_router.gr.dart';
import 'package:alalamia_admin/core/widgets/pop_loading.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/repos/auth_repo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

/// Cubit for managing application settings and user preferences
/// Handles theme changes, language switching, notification settings, and user sign out
/// Integrates with app configuration, authentication, and notification systems
class SettingsCubit extends Cubit<SettingsState> {
  /// Repository for managing notification settings and permissions
  final NotificationsRepo notificationsRepo;

  /// Repository for handling authentication operations like sign out
  final AuthRepo authRepo;

  /// App configuration manager for theme and language settings
  final AppConfig appConfig;

  /// Initialize the cubit with required dependencies
  /// Sets initial state with current app configuration
  SettingsCubit(this.appConfig, this.authRepo, this.notificationsRepo)
    : super(SettingsState.initial(appConfigModel: appConfig.state));

  /// Toggle between light and dark theme modes
  /// Updates app configuration and emits new state with updated config
  void changeTheme() {
    appConfig.changeTheme();
    emit(SettingsState.initial(appConfigModel: appConfig.state));
  }

  /// Update notification enable/disable setting
  /// [newValue] - true to enable notifications, false to disable
  /// Shows loading state during API call, then success or failure state
  void changeEnableNotifications({required final bool newValue}) async {
    // Show loading state while updating notification settings
    emit(const SettingsState.loading());

    // Call notifications repository to update setting
    final result = await notificationsRepo.changeEnableNotifications(
      isTurnOn: newValue,
    );

    // Handle the result and emit appropriate state
    result.when(
      // On success, emit initial state with updated configuration
      success:
          (_) => emit(SettingsState.initial(appConfigModel: appConfig.state)),
      // On failure, emit failure state with error details
      failure: (final error) => emit(SettingsState.failure(error)),
    );
  }

  /// Toggle between Arabic and English languages
  /// Updates app configuration and emits new state with updated config
  void changeLanguage() {
    appConfig.changeLanguage();
    emit(SettingsState.initial(appConfigModel: appConfig.state));
  }

  /// Sign out the current user and navigate to splash screen
  /// [context] - Build context for navigation
  /// Shows loading during sign out process
  // ignore: prefer_final_parameters
  void signOut(BuildContext context) async {
    // Show loading state during sign out process
    emit(const SettingsState.loading());

    // Call authentication repository to sign out user
    final result = await authRepo.signOut();

    // Handle sign out result
    result.when(
      success: (final data) {
        // On successful sign out, dismiss loading and navigate to splash
        PopLoading.dismiss();
        context.router.replace(const SplashRoute());
      },
      // On failure, emit failure state with error
      failure: (final error) => emit(SettingsState.failure(error)),
    );
  }

  /// Get current notification permission status
  /// Returns future with current permission state (granted, denied, provisional)
  Future<NotificationPermission> get notifiPermission =>
      notificationsRepo.notificationPermissionGranted;
}
