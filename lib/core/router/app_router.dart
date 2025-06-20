import 'package:alalamia_admin/core/router/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';

/// Main app router configuration using auto_route package
/// Defines all navigation routes and their hierarchical structure
/// Replaces 'View' with 'Route' in generated route names for consistency
@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  /// Singleton instance of the app router
  static final AppRouter instance = AppRouter._();

  // Private constructor for singleton pattern
  AppRouter._();

  /// Define the complete route structure for the application
  /// Includes authentication flow, main navigation, and detail screens
  @override
  List<AutoRoute> get routes => [
    // Splash screen - entry point of the app
    AutoRoute(page: SplashRoute.page, initial: true),

    // Authentication screen for user login
    AutoRoute(page: SignInRoute.page),

    // Main navigation wrapper with bottom navigation tabs
    AutoRoute(
      page: MainRoute.page,
      children: [
        // Statistics tab for analytics and reporting
        AutoRoute(page: StatisticsRoute.page),
        // Orders tab - default initial tab in main navigation
        AutoRoute(page: OrdersRoute.page, initial: true),
        // Settings tab for app configuration
        AutoRoute(page: SettingsRoute.page),
      ],
    ),

    // Order details screen for viewing individual order information
    AutoRoute(page: OrderDetailsRoute.page),
  ];
}
