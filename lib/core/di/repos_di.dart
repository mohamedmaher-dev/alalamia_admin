part of 'di.dart';

/// Initialize repository dependencies for data access layer
/// Uses lazy singleton pattern to ensure single instances of repositories
Future<void> _reposDIInit() async {
  // Authentication repository with multiple service dependencies
  // Handles user authentication, token management, and session persistence
  di.registerLazySingleton<AuthRepo>(
    () => AuthRepo(
      apiAuthService: di<ApiService>(),
      localStorageService: di<LocalStorageService>(),
      notificationsService: di<NotificationsService>(),
      appConfig: di<AppConfig>(),
    ),
  );

  // Orders repository for managing order data
  // Handles fetching, filtering, and caching of order information
  di.registerLazySingleton(
    () => OrdersRepo(
      apiOrdersService: di<ApiService>(),
      localStorageService: di<LocalStorageService>(),
    ),
  );

  // Order details repository for managing individual order information
  di.registerLazySingleton(() => OrderDetailsRepo(di<ApiService>()));

  // Statistics repository for analytics and reporting data
  di.registerLazySingleton(() => StatisticsRepos(di<ApiService>()));

  // Notifications repository for managing push notification settings
  di.registerLazySingleton(
    () => NotificationsRepo(notificationsService: di<NotificationsService>()),
  );
}
