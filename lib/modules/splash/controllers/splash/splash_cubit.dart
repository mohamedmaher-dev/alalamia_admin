import 'package:alalamia_admin/core/networking/dio_factory.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/repos/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

/// Cubit for managing splash screen logic and app initialization
/// Handles checking saved credentials and automatic authentication
class SplashCubit extends Cubit<SplashState> {
  /// Authentication repository for credential management
  final AuthRepo authRepo;

  /// Initialize the cubit with authentication repository dependency
  SplashCubit(this.authRepo) : super(const SplashState.initial());

  /// Start the app initialization process
  /// Checks for saved user credentials and attempts automatic login
  void start() async {
    // Get saved user credentials from local storage
    await authRepo.getUserCredential().then((final userCredential) async {
      if (userCredential != null) {
        // If credentials exist, try to refresh the authentication token
        final signInResult = await authRepo.refreshToken();
        signInResult.when(
          // If token refresh succeeds, set token and navigate to main screen
          success: (final success) {
            DioFactory.setToken(success.token);
            emit(const SplashState.successToLogin());
          },
          // If token refresh fails, navigate to sign in screen
          failure: (final failure) {
            emit(const SplashState.failedToLogin());
          },
        );
      } else {
        // If no credentials found, navigate to sign in screen
        emit(const SplashState.noCredential());
      }
    });
  }
}
