part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;
  const factory SplashState.noCredential() = _NoCredential;
  const factory SplashState.successToLogin() = _SuccessToLogin;
  const factory SplashState.failedToLogin() = _FailedToLogin;
}
