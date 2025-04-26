part of '../splash_view.dart';

void Function(BuildContext, SplashState) _listener = (
  final context,
  final state,
) {
  state.whenOrNull(
    failedToLogin: () => context.router.replace(const SignInRoute()),
    noCredential: () => context.router.replace(const SignInRoute()),
    successToLogin: () => context.router.replace(const MainRoute()),
  );
};
