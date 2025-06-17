part of '../settings_view.dart';

/// Global listener function for handling settings operation state changes
/// Manages UI feedback for loading and error states during settings operations
/// Provides user feedback through loading overlays and error snack bars
void Function(BuildContext, SettingsState) _listener = (
  final context,
  final state,
) {
  // Always dismiss any existing loading overlay first
  PopLoading.dismiss();

  state.whenOrNull(
    // Show loading overlay during settings operations (sign out, notification changes)
    loading: () => PopLoading.show(),
    // Show error message when settings operations fail
    failure:
        (final e) => AppSnackBar.show(msg: e.msg, type: ContentType.failure),
  );
};
