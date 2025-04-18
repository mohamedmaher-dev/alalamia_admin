part of 'di.dart';

Future<void> _rebosDIInit() async {
  di.registerLazySingleton<AuthRebo>(
    () => AuthRebo(
      apiAuthService: di<ApiService>(),
      localStorageService: di<LocalStorageService>(),
    ),
  );
  di.registerLazySingleton(
    () => OrdersRebo(
      apiOrdersService: di<ApiService>(),
      localStorageService: di<LocalStorageService>(),
    ),
  );
  di.registerLazySingleton(() => OrderDetailsRebo(di<ApiService>()));
  di.registerLazySingleton(() => StatisticsRebos(di<ApiService>()));
  di.registerLazySingleton(
    () => NotificationsRepo(
      appConfig: di<AppConfig>(),
      notificationsService: di<NotificationsService>(),
    ),
  );
}
