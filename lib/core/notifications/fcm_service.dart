import 'dart:io';
import 'package:alalamia_admin/core/notifications/in_app_notifi.dart';
import 'package:alalamia_admin/core/notifications/notifications_consts.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

/// Firebase Cloud Messaging (FCM) service for handling push notifications
/// Manages notification permissions, message handling, topic subscriptions, and tokens
/// Provides platform-specific implementations for iOS and Android
class FCMService {
  /// Firebase Messaging instance for FCM operations
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  /// Initialize the FCM service with all required configurations
  /// Sets up permissions, message handlers, and debug subscriptions
  /// Should be called during app startup
  Future<void> call() async {
    // Request notification permissions from user
    requestPermission();
    // Set up foreground message handling
    _onForegroundHandler();
    // Set up background message handling
    _onBackgroundHandler();

    // Auto-subscribe to admin topic in debug mode for testing
    if (kDebugMode) {
      await setSubscribeToTopic(
        topic: NotificationsConsts.adminTopic,
        isSubscribe: true,
      );
    }
  }

  /// Request notification permissions from the user
  /// Returns NotificationSettings with permission status
  Future<NotificationSettings> requestPermission() => _fcm.requestPermission();

  /// Set up background message handler for when app is not in foreground
  /// Background messages are handled by the global handler function
  void _onBackgroundHandler() async => FirebaseMessaging.onBackgroundMessage(
    _firebaseMessagingBackgroundHandler,
  );

  /// Set up foreground message handler for when app is active
  /// Shows in-app notifications when messages are received while app is open
  void _onForegroundHandler() => FirebaseMessaging.onMessage.listen(
    (final RemoteMessage message) => InAppNotification.show(
      message.notification!.title!,
      message.notification!.body!,
    ),
  );

  /// Subscribe or unsubscribe from a specific FCM topic
  /// [topic] - The topic name to subscribe/unsubscribe from
  /// [isSubscribe] - true to subscribe, false to unsubscribe
  /// Handles platform-specific implementations for iOS and Android
  Future<void> setSubscribeToTopic({
    required final String topic,
    required final bool isSubscribe,
  }) async {
    if (Platform.isIOS) {
      // iOS requires APNS token handling
      await _setSubscribeToTopicInIOS(topic: topic, isSubscribe: isSubscribe);
    } else {
      // Android can subscribe directly
      await _setSubscribeToTopicInAndroid(
        topic: topic,
        isSubscribe: isSubscribe,
      );
    }
  }

  /// iOS-specific topic subscription handling
  /// Waits for APNS token before subscribing to ensure proper setup
  /// [topic] - The topic name to subscribe/unsubscribe from
  /// [isSubscribe] - true to subscribe, false to unsubscribe
  Future<void> _setSubscribeToTopicInIOS({
    required final String topic,
    required final bool isSubscribe,
  }) async {
    // Get APNS token (Apple Push Notification Service)
    String? apnsToken = await _fcm.getAPNSToken();

    if (apnsToken != null) {
      // Token available, proceed with subscription
      if (isSubscribe) {
        await _fcm.subscribeToTopic(topic);
      } else {
        await _fcm.unsubscribeFromTopic(topic);
      }
    } else {
      // Token not ready, wait and retry
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

  /// Android-specific topic subscription handling
  /// Direct subscription without token waiting requirements
  /// [topic] - The topic name to subscribe/unsubscribe from
  /// [isSubscribe] - true to subscribe, false to unsubscribe
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

  /// Get FCM token for the device (Android specific)
  /// Token is used for device-specific push notifications
  Future<void> getToken() async {
    if (Platform.isAndroid) {
      await _fcm.getToken();
    }
  }

  /// Delete FCM token from the device (Android specific)
  /// Used when disabling notifications or during sign out
  Future<void> deleteToken() async {
    if (Platform.isAndroid) {
      await _fcm.deleteToken();
    }
  }

  /// Enable or disable automatic FCM initialization
  /// [isTurnOn] - true to enable auto-init, false to disable
  Future<void> setAutoInitEnabled({required final bool isTurnOn}) async =>
      await _fcm.setAutoInitEnabled(isTurnOn);

  /// Get current notification settings and permission status
  /// Returns NotificationSettings with authorization details
  Future<NotificationSettings> getNotificationSettings() async =>
      await _fcm.getNotificationSettings();
}

/// Global background message handler for FCM
/// Required to be a top-level function for platform message handling
/// Processes notifications when app is terminated or in background
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(
  final RemoteMessage message,
) async => debugPrint('Handling a background message: ${message.messageId}');
