import 'package:alalamia_admin/core/data/data_result.dart';
import 'package:alalamia_admin/core/errors/app_error.dart';
import 'package:alalamia_admin/core/notifications/notifications_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

/// Repository for managing notification settings and permissions
/// Acts as a data layer abstraction over the notifications service
/// Handles error wrapping and provides a consistent API for notification operations
class NotificationsRepo {
  /// Private notifications service instance for FCM operations
  final NotificationsService _notificationsService;

  /// Initialize repository with notifications service dependency
  NotificationsRepo({required final NotificationsService notificationsService})
    : _notificationsService = notificationsService;

  /// Enable or disable push notifications for the user
  /// [isTurnOn] - true to enable notifications, false to disable
  /// Returns DataResult wrapping the operation outcome
  Future<DataResult<void>> changeEnableNotifications({
    required final bool isTurnOn,
  }) async {
    try {
      // Delegate to notifications service to change setting
      await _notificationsService.changeEnableNotifications(isTurnOn: isTurnOn);
      // Return success with null data
      return const DataResult.success(data: null);
    } on Exception {
      // Wrap any exceptions in app error format
      return DataResult.failure(error: UnknownError());
    }
  }

  /// Get current notification permission status from the device
  /// Maps Firebase notification settings to app-specific permission enum
  /// Returns simplified permission status for UI consumption
  Future<NotificationPermission> get notificationPermissionGranted async {
    // Get detailed notification settings from FCM service
    final settings = await _notificationsService.notificationPermissionGranted;

    // Map Firebase authorization status to app permission enum
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      return NotificationPermission.granted;
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      return NotificationPermission.provisional;
    } else {
      return NotificationPermission.denied;
    }
  }
}
