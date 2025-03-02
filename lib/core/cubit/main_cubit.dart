import 'package:alalamia_admin/core/localization/app_localization_controller.dart';
import 'package:alalamia_admin/core/themes/app_theme_controller.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.dart';
part 'main_cubit.freezed.dart';

class MainCubit extends Cubit<MainState> {
  final AppLocalizationController appLocalizationController;
  final AppThemeController appThemeController;
  MainCubit(this.appLocalizationController, this.appThemeController)
    : super(MainState.initial(id: 0));
  Future<void> changeLanguage() async {
    await appLocalizationController.changeLanguage();
    emit(MainState.initial(id: state.hashCode));
  }

  changeTheme() async {
    await appThemeController.changeThemeMode();
    emit(MainState.initial(id: state.hashCode));
  }
}
