import 'dart:io';
import 'package:alalamia_admin/core/notifications/in_app_notifi.dart';
import 'package:alalamia_admin/core/notifications/notifications_consts.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FCMService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  Future<void> call() async {
    requestPermission();
    _onForegroundHandler();
    _onBackgroundHandler();
    if (kDebugMode) {
      await subscribeToTopic(topic: NotificationsConsts.adminTopic);
    }
  }

  Future<NotificationSettings> requestPermission() => _fcm.requestPermission();
  void _onBackgroundHandler() async => FirebaseMessaging.onBackgroundMessage(
    _firebaseMessagingBackgroundHandler,
  );

  void _onForegroundHandler() => FirebaseMessaging.onMessage.listen(
    (final RemoteMessage message) => InAppNotification.show(
      message.notification!.title!,
      message.notification!.body!,
    ),
  );

  Future<void> subscribeToTopic({required final String topic}) async {
    if (Platform.isIOS) {
      await _topicInIOS(topic: topic, isSubscribe: true);
    } else {
      await _fcm.subscribeToTopic(topic);
    }
  }

  Future<void> unSubscribeToTopic({required final String topic}) async {
    if (Platform.isIOS) {
      await _topicInIOS(topic: topic, isSubscribe: false);
    } else {
      await _fcm.unsubscribeFromTopic(topic);
    }
  }

  Future<void> _topicInIOS({
    required final String topic,
    required final bool isSubscribe,
  }) async {
    String? apnsToken = await _fcm.getAPNSToken();
    if (apnsToken != null) {
      if (isSubscribe) {
        await _fcm.subscribeToTopic(topic);
      } else {
        await _fcm.unsubscribeFromTopic(topic);
      }
    } else {
      await Future<void>.delayed(const Duration(seconds: 3));
      apnsToken = await _fcm.getAPNSToken();
      if (apnsToken != null) {
        if (isSubscribe) {
          await _fcm.subscribeToTopic(topic);
        } else {
          await _fcm.unsubscribeFromTopic(topic);
        }
      }
    }
  }

  Future<void> getToken() async {
    // if (Platform.isAndroid) {
    await _fcm.getToken();
    // }
  }

  Future<void> deleteToken() async {
    // if (Platform.isAndroid) {
    await _fcm.deleteToken();
    // }
  }

  Future<void> setAutoInitEnabled({required final bool isTurnOn}) async =>
      await _fcm.setAutoInitEnabled(isTurnOn);
  Future<NotificationSettings> getNotificationSettings() async =>
      await _fcm.getNotificationSettings();
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(
  final RemoteMessage message,
) async => debugPrint('Handling a background message: ${message.messageId}');
