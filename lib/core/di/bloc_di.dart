part of 'di.dart';

Future<void> _blocDiInit() async {
  di.registerFactory(() => SignInCubit(di<AuthRepo>()));
  di.registerFactory(() => SplashCubit(di<AuthRepo>()));
  di.registerFactory(() => OrdersCubit(di<OrdersRepo>()));
  di.registerFactory(InvoiceCubit.new);
  di.registerFactory(OrdersSearchCubit.new);
  di.registerFactory(() => OrderDetailsCubit(di<OrderDetailsRepo>()));
  di.registerFactory(() => OrderStatusCubit(di<OrderDetailsRepo>()));
  di.registerFactory(
    () => StatisticsCubit(di<StatisticsRepos>(), di<OrdersRepo>()),
  );
  di.registerFactory(
    () =>
        SettingsCubit(di<AppConfig>(), di<AuthRepo>(), di<NotificationsRepo>()),
  );
}
