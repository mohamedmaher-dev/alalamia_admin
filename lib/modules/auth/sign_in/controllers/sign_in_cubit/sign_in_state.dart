part of 'sign_in_cubit.dart';

@freezed
sealed class SignInState with _$SignInState {
  const factory SignInState.initial({required final bool isShowPassword}) =
      _Initial;
  const factory SignInState.loading() = _Loading;
  const factory SignInState.success() = _Success;
  const factory SignInState.failure({required final AppError e}) = _Failure;
}
