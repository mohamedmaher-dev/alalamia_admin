import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/notifications/notifications_consts.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

part 'fcm_service.dart';

class NotificationsService {
  final AppConfig _appConfig;
  final _FCMService _fcmService = _FCMService();
  NotificationsService({required AppConfig appConfig}) : _appConfig = appConfig;

  Future<void> call() async {
    await _fcmService();
    await enableNotifications(_appConfig.state.turnOnNotification);
  }

  Future<void> enableNotifications(bool turnOn) async {
    if (turnOn) {
      await _fcmService._fcm.subscribeToTopic(NotificationsConsts.adminTopic);
    } else {
      await _fcmService._fcm.unsubscribeFromTopic(
        NotificationsConsts.adminTopic,
      );
    }
  }
}
