import 'dart:io';
import 'package:alalamia_admin/core/notifications/notifications_consts.dart';
import 'package:alalamia_admin/core/widgets/app_snack_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FCMService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  Future<void> call() async {
    requestPermission();
    _onForegroundHandler();
    _onBackgroundHandler();
    if (kDebugMode) {
      await setSubscribeToTopic(
        topic: NotificationsConsts.adminTopic,
        isSubscribe: true,
      );
    }
  }

  Future<NotificationSettings> requestPermission() => _fcm.requestPermission();
  void _onBackgroundHandler() async => FirebaseMessaging.onBackgroundMessage(
    _firebaseMessagingBackgroundHandler,
  );

  void _onForegroundHandler() =>
      FirebaseMessaging.onMessage.listen((final RemoteMessage message) {
        AppSnackBar.show(
          title: message.notification!.title.toString(),
          msg: message.notification!.body.toString(),
          type: ContentType.help,
        );
      });

  Future<void> setSubscribeToTopic({
    required final String topic,
    required final bool isSubscribe,
  }) async {
    if (Platform.isIOS) {
      await _setSubscribeToTopicInIOS(topic: topic, isSubscribe: isSubscribe);
    } else {
      await _setSubscribeToTopicInAndroid(
        topic: topic,
        isSubscribe: isSubscribe,
      );
    }
  }

  Future<void> _setSubscribeToTopicInIOS({
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

  Future<void> _setSubscribeToTopicInAndroid({
    required final String topic,
    required final bool isSubscribe,
  }) async {
    if (isSubscribe) {
      await _fcm.subscribeToTopic(topic);
    } else {
      await _fcm.unsubscribeFromTopic(topic);
    }
  }

  Future<void> getToken() async {
    if (Platform.isAndroid) {
      await _fcm.getToken();
    }
  }

  Future<void> deleteToken() async {
    if (Platform.isAndroid) {
      await _fcm.deleteToken();
    }
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
