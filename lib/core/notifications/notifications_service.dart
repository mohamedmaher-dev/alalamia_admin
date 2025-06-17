import 'dart:async';
import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/notifications/fcm_service.dart';
import 'package:alalamia_admin/core/notifications/notifications_consts.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationsService {
  final AppConfig _appConfig;
  final _fcmService = FCMService();
  NotificationsService(this._appConfig);

  Future<void> call() async {
    await _fcmService();
  }

  Future<void> changeEnableNotifications({required final bool isTurnOn}) async {
    if (isTurnOn) {
      await _fcmService.getToken();
      await _fcmService.subscribeToTopic(topic: NotificationsConsts.adminTopic);
    } else {
      await _fcmService.unSubscribeToTopic(
        topic: NotificationsConsts.adminTopic,
      );
      await _fcmService.deleteToken();
    }
    await _fcmService.setAutoInitEnabled(isTurnOn: isTurnOn);
    _appConfig.changeTurnOnNotification(value: isTurnOn);
  }

  Future<NotificationSettings> get notificationPermissionGranted async =>
      await _fcmService.getNotificationSettings();
}

enum NotificationPermission { denied, granted, provisional }
