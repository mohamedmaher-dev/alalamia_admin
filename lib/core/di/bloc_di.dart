part of 'di.dart';

Future<void> _blocDiInit() async {
  di.registerLazySingleton<MainCubit>(
    () => MainCubit(di<AppLocalizationController>(), di<AppThemeController>()),
  );
  di.registerFactory<SignInCubit>(() => SignInCubit(di<AuthRebo>()));
  di.registerFactory<SplashCubit>(() => SplashCubit(di<AuthRebo>()));
  di.registerFactory(() => OrdersTabCubit());
  di.registerFactory(() => OrdersCubit(di<OrdersRebo>()));
  di.registerFactory(() => InvoiceCubit());
  di.registerFactory(() => FcmCubit());
  di.registerFactory(() => OrdersSearchCubit());
}
