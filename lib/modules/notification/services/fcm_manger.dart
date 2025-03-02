import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class FCMManger {
  static final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  static init() async {
    await _requestPermission();
  }

  static Future<void> _requestPermission() async {
    await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  static Future<void> send({
    required String title,
    required String body,
    required String fcmToken,
  }) async {
    final Dio dio = Dio();
    const String fcmUrl = "https://fcm.googleapis.com/fcm/send";
    const String serverToken =
        "AAAAloJqlgo:APA91bH8lMDwN7wvTpis4skfrgRtVFk2vk7XGJG96HesA9x-7chmyVEkjyTntiGEhL3SVZl_hcuF3W41LsDrVKdzVFJJfDZ-hoa54St11tYZPq4g_xnQ0CSFkrjfuqzjPlCC3dJDKvll";
    await dio.post(
      fcmUrl,
      options: Options(
        headers: <String, dynamic>{
          'Content-Type': 'application/json',
          'Authorization': 'key=$serverToken',
        },
      ),
      data: <String, dynamic>{
        'notification': <String, dynamic>{'body': body, 'title': title},
        'priority': 'high',
        'data': <String, dynamic>{
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'id': '1',
          'status': 'done',
        },
        'to': fcmToken,
      },
    );
  }
}
