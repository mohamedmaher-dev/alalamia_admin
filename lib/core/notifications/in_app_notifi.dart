import 'package:alalamia_admin/core/router/app_router.dart';
import 'package:alalamia_admin/core/widgets/in_app_notifi_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Global controller for displaying in-app notifications as overlays
/// Manages notification overlay entry and ensures only one notification shows at a time
/// Used throughout the app to show contextual notifications to users
class InAppNotification {
  /// Current overlay entry for active notification (null if none showing)
  static OverlayEntry? _entry;

  /// Display an in-app notification overlay
  /// [title] - The notification title text
  /// [message] - The notification message content
  /// [duration] - Auto-dismiss duration in seconds (default: 5)
  ///
  /// Automatically dismisses any existing notification before showing new one
  static void show(
    final String title,
    final String message, {
    final int duration = 5,
  }) {
    // Get overlay from current app context
    final overlay = Overlay.of(AppRouter.instance.navigatorKey.currentContext!);

    // Hide any existing notification before showing new one
    if (_entry != null && _entry!.mounted) _hide();

    // Create new overlay entry with notification widget
    _entry = OverlayEntry(
      builder:
          (final context) => InAppNotifiView(
            duration: duration,
            title: title,
            message: message,
            onDismissed: () => _hide(), // Auto-hide when dismissed
          ),
    );

    // Insert the notification overlay into the widget tree
    overlay.insert(_entry!);
  }

  /// Hide and clean up the current notification overlay
  /// Removes the overlay entry and disposes of resources
  static void _hide() => {_entry!.remove(), _entry!.dispose()};
}
