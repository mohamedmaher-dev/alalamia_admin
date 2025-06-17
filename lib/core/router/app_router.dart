import 'package:alalamia_admin/core/router/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  static final AppRouter instance = AppRouter._();
  AppRouter._();
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(
      page: MainRoute.page,
      children: [
        AutoRoute(page: StatisticsRoute.page),
        AutoRoute(page: OrdersRoute.page, initial: true),
        AutoRoute(page: SettingsRoute.page),
      ],
    ),
    AutoRoute(page: OrderDetailsRoute.page),
  ];
}
