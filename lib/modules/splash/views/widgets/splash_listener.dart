part of '../splash_view.dart';

void Function(BuildContext, SplashState) _listener = (
  final context,
  final state,
) {
  state.whenOrNull(
    failedToLogin: () => AppRouter.pushReplacement(AppPages.signIn),
    noCredential: () => AppRouter.pushReplacement(AppPages.signIn),
    successToLogin: () => AppRouter.pushReplacement(AppPages.home),
  );
};
