export 'app_config_model.dart';
import 'package:alalamia_admin/core/config/app_config_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class AppConfig extends HydratedCubit<AppConfigModel> {
  AppConfig() : super(const AppConfigModel());

  void changeLanguage() => emit(state.copyWith(language: _getNewLanguage()));
  void changeTheme() => emit(state.copyWith(isDarkMode: !state.isDarkMode));
  void changeTurnOnNotification({required final bool value}) =>
      emit(state.copyWith(turnOnNotification: value));

  @override
  AppConfigModel? fromJson(final Map<String, dynamic> json) =>
      AppConfigModel.fromJson(json);
  @override
  Map<String, dynamic>? toJson(final AppConfigModel model) => model.toJson();

  String _getNewLanguage() => state.language == 'ar' ? 'en' : 'ar';
}
