import 'package:alalamia_admin/modules/notification/services/fcm_manger.dart';
import 'package:alalamia_admin/modules/notification/services/fcm_result.dart';

class NotificationRebo {
  Future<FcmResult<void>> sendFcm({
    required String token,
    required String title,
    required String body,
  }) async {
    try {
      await FCMManger.send(title: title, body: body, fcmToken: token);
      return FcmResult.success(null);
    } catch (e) {
      return FcmResult.failure(e.toString());
    }
  }
}
