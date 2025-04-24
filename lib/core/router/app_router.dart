import 'package:alalamia_admin/core/di/di.dart';
import 'package:alalamia_admin/modules/auth/sign_in/controllers/sign_in_cubit/sign_in_cubit.dart';
import 'package:alalamia_admin/modules/auth/sign_in/views/sign_in_view.dart';
import 'package:alalamia_admin/modules/home/views/home_view.dart';
import 'package:alalamia_admin/modules/order_details/views/one_order_view.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart';
import 'package:alalamia_admin/modules/settings/views/settings_view.dart';
import 'package:alalamia_admin/modules/splash/controllers/splash/splash_cubit.dart';
import 'package:alalamia_admin/modules/splash/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'app_pages.dart';

class AppRouter {
  AppRouter._();
  static AppPages currentPage = AppPages.splash;
  static final routerConfig = GoRouter(
    routes: [
      GoRoute(
        path: AppPages.splash.path,
        builder:
            (final context, final state) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (final context) => di<SignInCubit>()),
                BlocProvider(create: (final context) => di<SplashCubit>()),
              ],
              child: const SplashView(),
            ),
      ),
      GoRoute(
        path: AppPages.signIn.path,
        builder:
            (final context, final state) => BlocProvider(
              create: (final context) => di<SignInCubit>(),
              child: const SignInView(),
            ),
      ),
      GoRoute(
        path: AppPages.home.path,
        builder: (final context, final state) => const HomeView(),
      ),
      GoRoute(
        path: AppPages.orderDetails.path,
        builder:
            (final context, final state) =>
                OrderDetailsView(args: state.extra as OrdersDatum),
      ),
      GoRoute(
        path: AppPages.settings.path,
        builder: (final context, final state) => const SettingsView(),
      ),
    ],
  );

  static void pushReplacement(final AppPages page, {final Object? extra}) {
    currentPage = page;
    routerConfig.go(page.path, extra: extra);
  }

  static Future<void> push(final AppPages page, {final Object? extra}) {
    currentPage = page;
    return routerConfig.push(page.path, extra: extra);
  }

  static void pushAndRemoveUntil(final AppPages page, {final Object? extra}) {
    currentPage = page;
    routerConfig.go(page.path, extra: extra);
  }

  static void pop() => routerConfig.pop();
}
