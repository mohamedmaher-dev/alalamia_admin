part of 'di.dart';

Future<void> _utilsDiInit() async {
  di.registerLazySingleton<AppConfig>(() => AppConfig());
  di.registerLazySingleton<LocalStorageService>(() => LocalStorageService());
  di.registerLazySingleton<NotificationsService>(
    () => NotificationsService(di<AppConfig>()),
  );
  di.registerLazySingleton<ApiService>(
    () => ApiService(di<Dio>(), baseUrl: Env.apiBaseUrl),
  );
  di.registerLazySingleton<Dio>(
    () => DioFactory.getDio(di<LocalStorageService>()),
  );
}
