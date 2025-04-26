part of '../sign_in_view.dart';

void Function(BuildContext, SignInState) _listener = (
  final context,
  final state,
) {
  final language = Language.of(context);
  PopLoading.dismiss();
  state.whenOrNull(
    loading: PopLoading.show,
    failure:
        (final e) => AppSnackBar.show(msg: e.msg, type: ContentType.failure),
    success: () {
      AppSnackBar.show(
        msg: language.you_have_logged_in_successfully,
        type: ContentType.success,
      );
      AppRouter.pushReplacement(AppPages.home);
    },
  );
};
