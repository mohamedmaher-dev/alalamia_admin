import 'package:alalamia_admin/core/router/app_router.dart';
import 'package:alalamia_admin/core/widgets/in_app_notifi_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InAppNotification {
  static OverlayEntry? _entry;
  static void show(
    final String title,
    final String message, {
    final int duration = 5,
  }) {
    final overlay = Overlay.of(AppRouter.instance.navigatorKey.currentContext!);
    if (_entry != null && _entry!.mounted) _hide();
    _entry = OverlayEntry(
      builder:
          (final context) => InAppNotifiView(
            duration: duration,
            title: title,
            message: message,
            onDismissed: () => _hide(),
          ),
    );
    overlay.insert(_entry!);
  }

  static void _hide() => {_entry!.remove(), _entry!.dispose()};
}
