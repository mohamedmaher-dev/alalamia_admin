import 'package:alalamia_admin/core/data/data_result.dart';
import 'package:alalamia_admin/core/errors/app_error.dart';
import 'package:alalamia_admin/core/notifications/notifications_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationsRepo {
  final NotificationsService _notificationsService;
  NotificationsRepo({required NotificationsService notificationsService})
    : _notificationsService = notificationsService;

  Future<DataResult<void>> changeEnableNotifications(bool isTurnOn) async {
    try {
      await _notificationsService.changeEnableNotifications(isTurnOn);
      return DataResult.success(data: null);
    } catch (e) {
      return DataResult.failure(error: UnknownError());
    }
  }

  Future<NotificationPermission> get notificationPermissionGranted async {
    final settings = await _notificationsService.notificationPermissionGranted;
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
