part of 'sign_in_cubit.dart';

/// Sign in state management using freezed sealed classes
/// Represents all possible states during the authentication process
@freezed
sealed class SignInState with _$SignInState {
  /// Initial state when the sign in screen is first loaded
  /// [isShowPassword] - Whether the password field should show plain text or be obscured
  const factory SignInState.initial({required final bool isShowPassword}) =
      _Initial;

  /// Loading state during authentication API call
  const factory SignInState.loading() = _Loading;

  /// Success state when authentication completes successfully
  const factory SignInState.success() = _Success;

  /// Failure state when authentication fails
  /// [e] - The error that occurred during authentication
  const factory SignInState.failure({required final AppError e}) = _Failure;
}
