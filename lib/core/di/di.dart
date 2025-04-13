import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/env/env.dart';
import 'package:alalamia_admin/core/local_storage/local_storage_service.dart';
import 'package:alalamia_admin/core/networking/api_service.dart';
import 'package:alalamia_admin/core/networking/dio_factory.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/rebos/auth_rebo.dart';
import 'package:alalamia_admin/modules/auth/sign_in/controllers/sign_in_cubit/sign_in_cubit.dart';
import 'package:alalamia_admin/modules/invoice/controllers/invoice/invoice_cubit.dart';
import 'package:alalamia_admin/modules/order_details/controllers/order_details/order_details_cubit.dart';
import 'package:alalamia_admin/modules/order_details/controllers/order_status/order_status_cubit.dart';
import 'package:alalamia_admin/modules/order_details/data/rebos/order_details_rebo.dart';
import 'package:alalamia_admin/modules/orders/controllers/orders/orders_cubit.dart';
import 'package:alalamia_admin/modules/orders/controllers/orders_search/orders_search_cubit.dart';
import 'package:alalamia_admin/modules/orders/data/rebos/orders_rebo.dart';
import 'package:alalamia_admin/modules/splash/controllers/splash/splash_cubit.dart';
import 'package:alalamia_admin/modules/statistics/controllers/statistics/statistics_cubit.dart';
import 'package:alalamia_admin/modules/statistics/data/rebos/statistics_rebos.dart';
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
