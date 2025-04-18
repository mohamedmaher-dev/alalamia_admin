import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/data/data_result.dart';
import 'package:alalamia_admin/core/errors/error_interface.dart';
import 'package:alalamia_admin/core/notifications/notifications_service.dart';

class NotificationsRepo {
  final NotificationsService _notificationsService;
  NotificationsRepo({
    required NotificationsService notificationsService,
    required AppConfig appConfig,
  }) : _notificationsService = notificationsService;

  Future<DataResult<void>> enableNotifications(bool enable) async {
    try {
      await _notificationsService.enableNotifications(enable);
      return DataResult.success(null);
    } catch (e) {
      return DataResult.error(UnknownError());
    }
  }
}
