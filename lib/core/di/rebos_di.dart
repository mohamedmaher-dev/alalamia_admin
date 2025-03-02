part of 'di.dart';

Future<void> _rebosDIInit() async {
  di.registerLazySingleton<AuthRebo>(
    () => AuthRebo(
      apiAuthService: di<ApiAuthService>(),
      localStorageService: di<LocalStorageService>(),
    ),
  );
  di.registerLazySingleton(
    () => OrdersRebo(apiOrdersService: di<ApiOrdersService>()),
  );
}
