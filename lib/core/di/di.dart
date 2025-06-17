import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/env/env.dart';
import 'package:alalamia_admin/core/local_storage/local_storage_service.dart';
import 'package:alalamia_admin/core/networking/api_service.dart';
import 'package:alalamia_admin/core/networking/dio_factory.dart';
import 'package:alalamia_admin/core/notifications/notifications_repo.dart';
import 'package:alalamia_admin/core/notifications/notifications_service.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/repos/auth_repo.dart';
import 'package:alalamia_admin/modules/auth/sign_in/controllers/sign_in_cubit/sign_in_cubit.dart';
import 'package:alalamia_admin/modules/invoice/controllers/invoice/invoice_cubit.dart';
import 'package:alalamia_admin/modules/order_details/controllers/order_details/order_details_cubit.dart';
import 'package:alalamia_admin/modules/order_details/controllers/order_status/order_status_cubit.dart';
import 'package:alalamia_admin/modules/order_details/data/repos/order_details_repo.dart';
import 'package:alalamia_admin/modules/orders/controllers/orders/orders_cubit.dart';
import 'package:alalamia_admin/modules/orders/controllers/orders_search/orders_search_cubit.dart';
import 'package:alalamia_admin/modules/orders/data/repos/orders_repo.dart';
import 'package:alalamia_admin/modules/settings/views/controllers/settings/settings_cubit.dart';
import 'package:alalamia_admin/modules/splash/controllers/splash/splash_cubit.dart';
import 'package:alalamia_admin/modules/statistics/controllers/statistics/statistics_cubit.dart';
import 'package:alalamia_admin/modules/statistics/data/repos/statistics_repos.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

// Import the dependency injection configuration files
part 'utils_di.dart';
part 'bloc_di.dart';
part 'repos_di.dart';

/// Global service locator instance for dependency injection
/// Uses GetIt package to manage application dependencies
GetIt di = GetIt.instance;

/// Main dependency injection class that handles the initialization
/// of all application dependencies including blocs, repositories, and services
class DependencyInjection {
  // Private constructor to prevent instantiation
  DependencyInjection._();

  /// Initialize all dependency injection modules
  /// This method must be called during app startup before using any dependencies
  static Future<void> init() async {
    // Initialize all bloc/cubit dependencies
    await _blocDiInit();
    // Initialize utility services and core dependencies
    await _utilsDiInit();
    // Initialize repository dependencies
    await _reposDIInit();
  }
}
