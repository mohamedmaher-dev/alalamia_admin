import 'package:alalamia_admin/core/networking/dio_factory.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/rebos/auth_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  final AuthRebo authRebo;
  SplashCubit(this.authRebo) : super(const SplashState.initial());
  void start() async {
    await authRebo.getUserCredential().then((final userCredential) async {
      if (userCredential != null) {
        final signInResult = await authRebo.refreshToken();
        signInResult.when(
          success: (final success) {
            DioFactory.setToken(success.token);
            emit(const SplashState.successToLogin());
          },
          failure: (final failure) {
            emit(const SplashState.failedToLogin());
          },
        );
      } else {
        emit(const SplashState.noCredential());
      }
    });
  }
}
