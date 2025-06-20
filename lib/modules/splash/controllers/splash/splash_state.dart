part of 'splash_cubit.dart';

/// State management for splash screen and app initialization
/// Handles different authentication states during app startup
@freezed
class SplashState with _$SplashState {
  /// Initial state when splash screen is first displayed
  const factory SplashState.initial() = _Initial;

  /// State when no saved user credentials are found
  /// App should navigate to sign in screen
  const factory SplashState.noCredential() = _NoCredential;

  /// State when saved credentials are valid and token refresh succeeded
  /// App should navigate to main screen
  const factory SplashState.successToLogin() = _SuccessToLogin;

  /// State when saved credentials exist but token refresh failed
  /// App should navigate to sign in screen
  const factory SplashState.failedToLogin() = _FailedToLogin;
}
