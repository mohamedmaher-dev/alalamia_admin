part of 'notifications_service.dart';

class _FCMService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  Future<void> call() async {
    requestPermission();
    _onForegroundHandler();
    _onBackgroundHandler();
    if (kDebugMode) {
      await _fcm.subscribeToTopic(NotificationsConsts.adminTopicDebug);
    }
  }

  Future<NotificationSettings> requestPermission() => _fcm.requestPermission();
  void _onBackgroundHandler() async => FirebaseMessaging.onBackgroundMessage(
    _firebaseMessagingBackgroundHandler,
  );

  void _onForegroundHandler() {
    FirebaseMessaging.onMessage.listen((final RemoteMessage message) {
      AppSnackBar.show(
        title: message.notification!.title.toString(),
        msg: message.notification!.body.toString(),
        type: ContentType.help,
      );
    });
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(
  final RemoteMessage message,
) async => debugPrint('Handling a background message: ${message.messageId}');
