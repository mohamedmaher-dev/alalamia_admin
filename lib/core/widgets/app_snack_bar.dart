import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

/// Global snack bar utility for showing user feedback messages
/// Provides a consistent way to display success, error, warning, and info messages
/// throughout the application using the awesome_snackbar_content package
class AppSnackBar {
  // Private constructor to prevent instantiation
  AppSnackBar._();

  /// Global build context for showing snack bars
  static late BuildContext _context;

  /// Initialize the snack bar with the current build context
  /// This must be called once during app initialization
  /// [context] - Build context from the main widget tree
  static void init(final BuildContext context) =>
      AppSnackBar._context = context;

  /// Display a snack bar with custom message and type
  /// [msg] - The message content to display
  /// [type] - The type of snack bar (success, failure, warning, help)
  /// [title] - Optional custom title, if not provided uses localized default
  static void show({
    required final String msg,
    required final ContentType type,
    final String? title,
  }) {
    // Create a custom snack bar with transparent background and awesome content
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 5),
      padding: EdgeInsets.all(25.w),
      content: AwesomeSnackbarContent(
        title: _getTitle(type, title),
        message: msg,
        contentType: type,
      ),
    );

    // Hide any current snack bar and show the new one
    ScaffoldMessenger.of(_context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  /// Get the appropriate title for the snack bar based on type and custom title
  /// [type] - The content type to determine default title
  /// [title] - Custom title if provided, takes precedence over default
  /// Returns the title string to display
  static String _getTitle(final ContentType type, final String? title) {
    final language = Language();
    // Use custom title if provided, otherwise use localized default based on type
    if (title != null) {
      return title;
    } else {
      return switch (type) {
        ContentType.success => language.success,
        ContentType.warning => language.warning,
        ContentType.failure => language.failure,
        ContentType.help => language.notification,
        ContentType() => throw UnimplementedError(),
      };
    }
  }
}
