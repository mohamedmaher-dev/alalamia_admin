part of '../settings_view.dart';

void Function(BuildContext, SettingsState) _listener = (context, state) {
  PopLoading.dismiss();
  state.whenOrNull(
    loading: () => PopLoading.show(),
    failure:
        (e) => AppSnackBar.show(context, msg: e.msg, type: ContentType.failure),
  );
};
