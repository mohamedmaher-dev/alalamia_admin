part of 'di.dart';

Future<void> _blocDiInit() async {
  di.registerFactory(() => SignInCubit(di<AuthRebo>()));
  di.registerFactory(() => SplashCubit(di<AuthRebo>()));
  di.registerFactory(() => OrdersCubit(di<OrdersRebo>()));
  di.registerFactory(InvoiceCubit.new);
  di.registerFactory(OrdersSearchCubit.new);
  di.registerFactory(() => OrderDetailsCubit(di<OrderDetailsRebo>()));
  di.registerFactory(() => OrderStatusCubit(di<OrderDetailsRebo>()));
  di.registerFactory(
    () => StatisticsCubit(di<StatisticsRebos>(), di<OrdersRebo>()),
  );
  di.registerFactory(
    () =>
        SettingsCubit(di<AppConfig>(), di<AuthRebo>(), di<NotificationsRepo>()),
  );
}
