part of '../splash_view.dart';

/// Global listener function for handling splash screen state changes
/// Manages navigation based on authentication status and stored credentials
/// Determines whether to show main app or sign in screen
void Function(BuildContext, SplashState) _listener = (
  final context,
  final state,
) {
  state.whenOrNull(
    // Failed authentication with stored credentials - redirect to sign in
    failedToLogin: () => context.router.replace(const SignInRoute()),
    // No stored credentials found - redirect to sign in
    noCredential: () => context.router.replace(const SignInRoute()),
    // Successful authentication - proceed to main app
    successToLogin: () => context.router.replace(const MainRoute()),
  );
};
