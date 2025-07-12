part of '../sign_in_view.dart';

/// Global listener function for handling sign in state changes
/// Manages UI feedback for loading, success, and failure states
/// Handles navigation and displays appropriate snack bar messages
void Function(BuildContext, SignInState) _listener = (
  final context,
  final state,
) {
  final language = Language.of(context);

  // Always dismiss any existing loading overlay first
  PopLoading.dismiss();

  state.whenOrNull(
    // Show loading overlay during authentication API call
    loading: PopLoading.show,
    // Show error message when authentication fails
    failure:
        (final e) => AppSnackBar.show(msg: e.msg, type: ContentType.failure),
    // Handle successful authentication
    success: () {
      // Show success message to user
      AppSnackBar.show(
        msg: language.you_have_logged_in_successfully,
        type: ContentType.success,
      );
      // Navigate to main app screen and replace sign in route
      context.router.replace(const MainRoute());
    },
  );
};
