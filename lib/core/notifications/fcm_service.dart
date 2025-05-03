part of 'notifications_service.dart';

class _FCMService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  Future<void> call() async {
    requestPermission();
    _onForegroundHandler();
    _onBackgroundHandler();
    if (kDebugMode) {
      await subscribeToTopicGeneralMethod(
        topic: NotificationsConsts.adminTopic,
      );
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

  Future<void> subscribeToTopicGeneralMethod({
    required final String topic,
  }) async {
    if (Platform.isIOS) {
      await _subscribeToTopicIOS(topic: topic);
    } else {
      await _fcm.subscribeToTopic(topic);
    }
  }

  Future<void> unSubscribeToTopicGeneralMethod({
    required final String topic,
  }) async {
    if (Platform.isIOS) {
      await _unSubscribeToTopicIOS(topic: topic);
    } else {
      await _fcm.unsubscribeFromTopic(topic);
    }
  }

  Future<void> _subscribeToTopicIOS({required final String topic}) async {
    String? apnsToken = await _fcm.getAPNSToken();
    if (apnsToken != null) {
      await _fcm.subscribeToTopic(topic);
    } else {
      await Future<void>.delayed(const Duration(seconds: 3));
      apnsToken = await _fcm.getAPNSToken();
      if (apnsToken != null) {
        await _fcm.subscribeToTopic(topic);
      }
    }
  }

  Future<void> _unSubscribeToTopicIOS({required final String topic}) async {
    String? apnsToken = await _fcm.getAPNSToken();
    if (apnsToken != null) {
      await _fcm.unsubscribeFromTopic(topic);
    } else {
      await Future<void>.delayed(const Duration(seconds: 3));
      apnsToken = await _fcm.getAPNSToken();
      if (apnsToken != null) {
        await _fcm.unsubscribeFromTopic(topic);
      }
    }
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(
  final RemoteMessage message,
) async => debugPrint('Handling a background message: ${message.messageId}');
