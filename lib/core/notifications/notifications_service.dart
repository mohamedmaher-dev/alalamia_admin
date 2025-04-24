import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/notifications/notifications_consts.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

part 'fcm_service.dart';

class NotificationsService {
  final AppConfig _appConfig;
  final _FCMService _fcmService = _FCMService();
  NotificationsService(this._appConfig);

  Future<void> call() async {
    await _fcmService();
  }

  Future<void> changeEnableNotifications({required final bool isTurnOn}) async {
    if (kDebugMode) {
      await _fcmService._fcm.subscribeToTopic(
        NotificationsConsts.adminTopicDebug,
      );
    }
    if (isTurnOn) {
      await _fcmService._fcm.subscribeToTopic(NotificationsConsts.adminTopic);
      await _fcmService._fcm.getAPNSToken();
      await _fcmService._fcm.getToken();
    } else {
      await _fcmService._fcm.unsubscribeFromTopic(
        NotificationsConsts.adminTopic,
      );
      await _fcmService._fcm.deleteToken();
    }
    await _fcmService._fcm.setAutoInitEnabled(isTurnOn);
    _appConfig.changeTurnOnNotification(value: isTurnOn);
  }

  Future<NotificationSettings> get notificationPermissionGranted async =>
      await _fcmService._fcm.getNotificationSettings();
}

enum NotificationPermission { denied, granted, provisional }
