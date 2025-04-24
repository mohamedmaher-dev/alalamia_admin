part of 'notifications_service.dart';

class _FCMService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  Future<void> call() async {
    await requestPermission();
    await _backgroundFCM();
  }

  Future<NotificationSettings> requestPermission() => _fcm.requestPermission();
  Future<void> _backgroundFCM() async => FirebaseMessaging.onBackgroundMessage(
    _firebaseMessagingBackgroundHandler,
  );
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(
  final RemoteMessage message,
) async => debugPrint('Handling a background message: ${message.messageId}');
