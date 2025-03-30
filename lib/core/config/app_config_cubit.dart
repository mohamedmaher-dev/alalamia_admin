import 'package:alalamia_admin/core/config/app_config_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
export 'app_config_model.dart';

class AppConfig extends HydratedCubit<AppConfigModel> {
  AppConfig() : super(AppConfigModel());

  void changeLanguage() => emit(state.copyWith(language: _getNewLanguage()));
  void changeTheme() => emit(state.copyWith(isDarkMode: !state.isDarkMode));

  @override
  AppConfigModel? fromJson(Map<String, dynamic> json) =>
      AppConfigModel.fromJson(json);
  @override
  Map<String, dynamic>? toJson(AppConfigModel state) => state.toJson();

  _getNewLanguage() => state.language == 'ar' ? 'en' : 'ar';
}
