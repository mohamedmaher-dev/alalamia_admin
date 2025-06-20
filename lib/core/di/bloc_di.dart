part of 'di.dart';

/// Initialize all BLoC/Cubit dependencies for state management
/// Registers factory instances of all cubits used throughout the application
/// Factory registration means a new instance is created each time it's requested
Future<void> _blocDiInit() async {
  // Authentication related cubits
  di.registerFactory(() => SignInCubit(di<AuthRepo>()));
  di.registerFactory(() => SplashCubit(di<AuthRepo>()));

  // Order management cubits
  di.registerFactory(() => OrdersCubit(di<OrdersRepo>()));
  di.registerFactory(() => OrderDetailsCubit(di<OrderDetailsRepo>()));
  di.registerFactory(() => OrderStatusCubit(di<OrderDetailsRepo>()));

  // Utility and feature cubits
  di.registerFactory(InvoiceCubit.new);
  di.registerFactory(OrdersSearchCubit.new);

  // Statistics cubit with multiple dependencies
  di.registerFactory(
    () => StatisticsCubit(di<StatisticsRepos>(), di<OrdersRepo>()),
  );

  // Settings cubit with app configuration and notification dependencies
  di.registerFactory(
    () =>
        SettingsCubit(di<AppConfig>(), di<AuthRepo>(), di<NotificationsRepo>()),
  );
}
