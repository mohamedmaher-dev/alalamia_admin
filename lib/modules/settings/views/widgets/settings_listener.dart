part of '../settings_view.dart';

void Function(BuildContext, SettingsState) _listener = (
  final context,
  final state,
) {
  PopLoading.dismiss();
  state.whenOrNull(
    loading: () => PopLoading.show(),
    failure:
        (final e) =>
            AppSnackBar.show(context, msg: e.msg, type: ContentType.failure),
  );
};
