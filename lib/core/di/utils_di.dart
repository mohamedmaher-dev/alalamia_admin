part of 'di.dart';

Future<void> _utilsDiInit() async {
  di.registerLazySingleton<LocalStorageService>(() => LocalStorageService());
  di.registerLazySingleton<AppThemeController>(
    () => AppThemeController(di<LocalStorageService>()),
  );

  di.registerLazySingleton<AppLocalizationController>(
    () => AppLocalizationController(di<LocalStorageService>()),
  );
  di.registerLazySingleton<ApiService>(
    () => ApiService(di<Dio>(), baseUrl: Env.apiBaseUrl),
  );
  di.registerLazySingleton<Dio>(() => DioFactory.getDio());
}
