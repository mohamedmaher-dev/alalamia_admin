part of 'di.dart';

Future<void> _reposDIInit() async {
  di.registerLazySingleton<AuthRepo>(
    () => AuthRepo(
      apiAuthService: di<ApiService>(),
      localStorageService: di<LocalStorageService>(),
      notificationsService: di<NotificationsService>(),
      appConfig: di<AppConfig>(),
    ),
  );
  di.registerLazySingleton(
    () => OrdersRepo(
      apiOrdersService: di<ApiService>(),
      localStorageService: di<LocalStorageService>(),
    ),
  );
  di.registerLazySingleton(() => OrderDetailsRepo(di<ApiService>()));
  di.registerLazySingleton(() => StatisticsRepos(di<ApiService>()));
  di.registerLazySingleton(
    () => NotificationsRepo(notificationsService: di<NotificationsService>()),
  );
}
