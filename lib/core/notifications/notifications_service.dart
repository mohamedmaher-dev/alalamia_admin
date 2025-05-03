import 'dart:async';
import 'dart:io';

import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/notifications/notifications_consts.dart';
import 'package:alalamia_admin/core/widgets/app_snack_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
part 'fcm_service.dart';

class NotificationsService {
  final AppConfig _appConfig;
  final _fcmService = _FCMService();
  NotificationsService(this._appConfig);

  Future<void> call() async {
    await _fcmService();
  }

  Future<void> changeEnableNotifications({required final bool isTurnOn}) async {
    if (isTurnOn) {
      await _fcmService.subscribeToTopicGeneralMethod(
        topic: NotificationsConsts.adminTopic,
      );
    } else {
      await _fcmService.unSubscribeToTopicGeneralMethod(
        topic: NotificationsConsts.adminTopic,
      );
    }
    await _fcmService._fcm.setAutoInitEnabled(isTurnOn);
    _appConfig.changeTurnOnNotification(value: isTurnOn);
  }

  Future<NotificationSettings> get notificationPermissionGranted async =>
      await _fcmService._fcm.getNotificationSettings();
}

enum NotificationPermission { denied, granted, provisional }
