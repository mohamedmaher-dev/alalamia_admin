part of 'di.dart';

Future<void> _rebosDIInit() async {
  di.registerLazySingleton<AuthRebo>(
    () => AuthRebo(
      apiAuthService: di<ApiService>(),
      localStorageService: di<LocalStorageService>(),
      notificationsService: di<NotificationsService>(),
      appConfig: di<AppConfig>(),
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
    () => NotificationsRepo(notificationsService: di<NotificationsService>()),
  );
}
