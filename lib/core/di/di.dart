import 'package:alalamia_admin/core/cubit/main_cubit.dart';
import 'package:alalamia_admin/core/env/env.dart';
import 'package:alalamia_admin/core/local_storage/local_storage_service.dart';
import 'package:alalamia_admin/core/localization/app_localization_controller.dart';
import 'package:alalamia_admin/core/networking/dio_factory.dart';
import 'package:alalamia_admin/core/themes/app_theme_controller.dart';
import 'package:alalamia_admin/modules/auth/rebos/auth_rebo.dart';
import 'package:alalamia_admin/modules/auth/services/api_auth_service.dart';
import 'package:alalamia_admin/modules/auth/sign_in/controllers/sign_in_cubit/sign_in_cubit.dart';
import 'package:alalamia_admin/modules/invoice/controllers/invoice/invoice_cubit.dart';
import 'package:alalamia_admin/modules/notification/controllers/send_fcm/send_fcm_cubit.dart';
import 'package:alalamia_admin/modules/orders/controlers/orders/orders_cubit.dart';
import 'package:alalamia_admin/modules/orders/controlers/orders_tab/orders_tab_cubit.dart';
import 'package:alalamia_admin/modules/orders/data/rebos/orders_rebo.dart';
import 'package:alalamia_admin/modules/orders/services/api_orders_service.dart';
import 'package:alalamia_admin/modules/splash/controllers/splash/splash_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

part 'utils_di.dart';
part 'bloc_di.dart';
part 'rebos_di.dart';

GetIt di = GetIt.instance;

Future<void> diInit() async {
  await _blocDiInit();
  await _utilsDiInit();
  await _rebosDIInit();
}
