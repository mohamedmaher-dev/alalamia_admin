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
            (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => di<SignInCubit>()),
                BlocProvider(create: (context) => di<SplashCubit>()),
              ],
              child: const SplashView(),
            ),
      ),
      GoRoute(
        path: AppPages.signIn.path,
        builder:
            (context, state) => BlocProvider(
              create: (context) => di<SignInCubit>(),
              child: const SignInView(),
            ),
      ),
      GoRoute(
        path: AppPages.home.path,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: AppPages.orderDetails.path,
        builder:
            (context, state) =>
                OrderDetailsView(args: state.extra as OrdersDatum),
      ),
      GoRoute(
        path: AppPages.settings.path,
        builder: (context, state) => SettingsView(),
      ),
    ],
  );

  static pushReplacement(AppPages page, {Object? extra}) {
    currentPage = page;
    routerConfig.go(page.path, extra: extra);
  }

  static Future<void> push(AppPages page, {Object? extra}) {
    currentPage = page;
    return routerConfig.push(page.path, extra: extra);
  }

  static pushAndRemoveUntil(AppPages page, {Object? extra}) {
    currentPage = page;
    routerConfig.go(page.path, extra: extra);
  }

  static pop() => routerConfig.pop();
}
