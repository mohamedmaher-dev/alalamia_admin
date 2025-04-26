import 'package:alalamia_admin/core/router/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(
      page: MainRoute.page,
      children: [
        AutoRoute(page: StatisticsRoute.page, maintainState: false),
        AutoRoute(page: OrdersRoute.page, maintainState: false, initial: true),
        AutoRoute(page: SettingsRoute.page),
      ],
    ),
    AutoRoute(page: OrderDetailsRoute.page),
  ];
}
