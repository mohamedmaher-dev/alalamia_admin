part of '../splash_view.dart';

void Function(BuildContext, SplashState) _listener = (context, state) {
  state.whenOrNull(
    failedToLogin: () => AppRouter.pushReplacement(AppPages.signIn),
    noCredential: () => AppRouter.pushReplacement(AppPages.home),
    successToLogin: () => AppRouter.pushReplacement(AppPages.home),
  );
};
