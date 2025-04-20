import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/errors/error_interface.dart';
import 'package:alalamia_admin/core/notifications/notifications_repo.dart';
import 'package:alalamia_admin/core/notifications/notifications_service.dart';
import 'package:alalamia_admin/core/router/app_router.dart';
import 'package:alalamia_admin/core/widgets/pop_loading.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/rebos/auth_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final NotificationsRepo notificationsRepo;
  final AuthRebo authRebo;
  final AppConfig appConfig;
  SettingsCubit(this.appConfig, this.authRebo, this.notificationsRepo)
    : super(SettingsState.initial(appConfigModel: appConfig.state));

  void changeTheme() {
    appConfig.changeTheme();
    emit(SettingsState.initial(appConfigModel: appConfig.state));
  }

  void changeEnableNotifications(bool newValue) async {
    emit(SettingsState.loading());
    final result = await notificationsRepo.changeEnableNotifications(newValue);
    result.when(
      success:
          (_) => emit(SettingsState.initial(appConfigModel: appConfig.state)),
      error: (error) => emit(SettingsState.failure(error)),
    );
  }

  void changeLanguage() {
    appConfig.changeLanguage();
    emit(SettingsState.initial(appConfigModel: appConfig.state));
  }

  void signOut() async {
    emit(SettingsState.loading());
    final result = await authRebo.signOut();
    result.when(
      success: (data) {
        PopLoading.dismiss();
        AppRouter.pushReplacement(AppPages.splash);
      },
      error: (error) => emit(SettingsState.failure(error)),
    );
  }

  Future<NotificationPermission> get notifiPermission =>
      notificationsRepo.notificationPermissionGranted;
}
