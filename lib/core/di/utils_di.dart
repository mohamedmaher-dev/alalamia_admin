part of 'di.dart';

Future<void> _utilsDiInit() async {
  di.registerLazySingleton<LocalStorageService>(() => LocalStorageService());
  di.registerLazySingleton<AppThemeController>(
    () => AppThemeController(di<LocalStorageService>()),
  );

  di.registerLazySingleton<AppLocalizationController>(
    () => AppLocalizationController(di<LocalStorageService>()),
  );
  di.registerLazySingleton<ApiAuthService>(
    () => ApiAuthService(di<Dio>(), baseUrl: Env.apiAuthBaseUrl),
  );
  di.registerLazySingleton(
    () => ApiOrdersService(di<Dio>(), baseUrl: Env.apiOrdersBaseUrl),
  );
  di.registerLazySingleton<Dio>(() => DioFactory.getDio());
}
