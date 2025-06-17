import 'dart:async';
import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/notifications/fcm_service.dart';
import 'package:alalamia_admin/core/notifications/notifications_consts.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

/// Service for managing Firebase Cloud Messaging (FCM) push notifications
/// Handles notification initialization, token management, topic subscriptions,
/// and integration with app configuration settings
class NotificationsService {
  /// App configuration for managing notification preferences
  final AppConfig _appConfig;

  /// FCM service instance for Firebase messaging operations
  final _fcmService = FCMService();

  /// Initialize the service with app configuration dependency
  NotificationsService(this._appConfig);

  /// Initialize the FCM service
  /// This should be called during app startup to set up notifications
  Future<void> call() async {
    await _fcmService();
  }

  /// Enable or disable push notifications for the user
  /// [isTurnOn] - true to enable notifications, false to disable
  /// Manages FCM token, topic subscriptions, and auto-initialization
  Future<void> changeEnableNotifications({required final bool isTurnOn}) async {
    if (isTurnOn) {
      // Get FCM token when enabling notifications
      await _fcmService.getToken();
    }

    // Subscribe or unsubscribe from admin topic based on preference
    await _fcmService.setSubscribeToTopic(
      topic: NotificationsConsts.adminTopic,
      isSubscribe: isTurnOn,
    );

    if (!isTurnOn) {
      // Delete FCM token when disabling notifications
      await _fcmService.deleteToken();
    }

    // Enable or disable FCM auto-initialization
    await _fcmService.setAutoInitEnabled(isTurnOn: isTurnOn);

    // Update app configuration with new notification preference
    _appConfig.changeTurnOnNotification(value: isTurnOn);
  }

  /// Get current notification permission settings from the device
  /// Returns notification settings including authorization status
  Future<NotificationSettings> get notificationPermissionGranted async =>
      await _fcmService.getNotificationSettings();
}

/// Enum representing different notification permission states
enum NotificationPermission {
  /// User denied notification permissions
  denied,

  /// User granted full notification permissions
  granted,

  /// User granted provisional permissions (iOS only)
  provisional,
}
