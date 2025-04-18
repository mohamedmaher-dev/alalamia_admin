part of 'notifications_service.dart';

class _FCMService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  Future<void> call() async {
    await requestPermission();
    await _backgroundFCM();
    if (kDebugMode) {
      await _fcm.subscribeToTopic(NotificationsConsts.adminTopicDebug);
    }
  }

  Future<NotificationSettings> requestPermission() => _fcm.requestPermission(
    alert: true,
    badge: true,
    sound: true,
    provisional: false,
    carPlay: false,
    criticalAlert: false,
    announcement: false,
  );
  Future<void> _backgroundFCM() async => FirebaseMessaging.onBackgroundMessage(
    _firebaseMessagingBackgroundHandler,
  );

  @pragma('vm:entry-point')
  Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async => debugPrint('Handling a background message: ${message.messageId}');
}
