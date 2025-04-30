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

class SettingsCubit extends Cubit<SettingsState> {
  final NotificationsRepo notificationsRepo;
  final AuthRepo authRepo;
  final AppConfig appConfig;
  SettingsCubit(this.appConfig, this.authRepo, this.notificationsRepo)
    : super(SettingsState.initial(appConfigModel: appConfig.state));

  void changeTheme() {
    appConfig.changeTheme();
    emit(SettingsState.initial(appConfigModel: appConfig.state));
  }

  void changeEnableNotifications({required final bool newValue}) async {
    emit(const SettingsState.loading());
    final result = await notificationsRepo.changeEnableNotifications(
      isTurnOn: newValue,
    );
    result.when(
      success:
          (_) => emit(SettingsState.initial(appConfigModel: appConfig.state)),
      failure: (final error) => emit(SettingsState.failure(error)),
    );
  }

  void changeLanguage() {
    appConfig.changeLanguage();
    emit(SettingsState.initial(appConfigModel: appConfig.state));
  }

  // ignore: prefer_final_parameters
  void signOut(BuildContext context) async {
    emit(const SettingsState.loading());
    final result = await authRepo.signOut();
    result.when(
      success: (final data) {
        PopLoading.dismiss();
        context.router.replace(const SplashRoute());
      },
      failure: (final error) => emit(SettingsState.failure(error)),
    );
  }

  Future<NotificationPermission> get notifiPermission =>
      notificationsRepo.notificationPermissionGranted;
}
