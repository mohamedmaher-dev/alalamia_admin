part of 'di.dart';

Future<void> _blocDiInit() async {
  di.registerLazySingleton<AppConfig>(() => AppConfig());
  di.registerFactory<SignInCubit>(() => SignInCubit(di<AuthRebo>()));
  di.registerFactory<SplashCubit>(() => SplashCubit(di<AuthRebo>()));
  di.registerFactory(() => OrdersCubit(di<OrdersRebo>()));
  di.registerFactory(() => InvoiceCubit());
  di.registerFactory(() => OrdersSearchCubit());
  di.registerFactory(() => OrderDetailsCubit(di<OrderDetailsRebo>()));
  di.registerFactory(() => OrderStatusCubit(di<OrderDetailsRebo>()));
  di.registerFactory(
    () => StatisticsCubit(di<StatisticsRebos>(), di<OrdersRebo>()),
  );
}
