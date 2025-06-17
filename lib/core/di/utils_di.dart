part of 'di.dart';

/// Initialize utility services and core application dependencies
/// Uses lazy singleton pattern for services that should persist throughout the app lifecycle
Future<void> _utilsDiInit() async {
  // Application configuration manager (singleton)
  di.registerLazySingleton<AppConfig>(AppConfig.new);

  // Local storage service for caching and persistence (singleton)
  di.registerLazySingleton<LocalStorageService>(LocalStorageService.new);

  // Push notifications service with app configuration dependency (singleton)
  di.registerLazySingleton<NotificationsService>(
    () => NotificationsService(di<AppConfig>()),
  );

  // API service for network requests with Dio client and base URL (singleton)
  di.registerLazySingleton<ApiService>(
    () => ApiService(di<Dio>(), baseUrl: Env.apiBaseUrl),
  );

  // HTTP client (Dio) configured with interceptors and local storage (singleton)
  di.registerLazySingleton<Dio>(
    () => DioFactory.getDio(di<LocalStorageService>()),
  );
}
