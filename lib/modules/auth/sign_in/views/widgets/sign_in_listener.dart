part of '../sign_in_view.dart';

void Function(BuildContext, SignInState) _listener = (context, state) {
  final language = Language.of(context);
  PopLoading.dismiss();
  state.whenOrNull(
    loading: () => PopLoading.show(),
    failure:
        (e) => AppSnackBar.show(context, msg: e.msg, type: ContentType.failure),
    success: () {
      AppSnackBar.show(
        context,
        msg: language.you_have_logged_in_successfully,
        type: ContentType.success,
      );
      AppRouter.pushReplacement(AppPages.home);
    },
  );
};
