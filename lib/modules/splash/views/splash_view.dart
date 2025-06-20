import 'package:alalamia_admin/core/di/di.dart';
import 'package:alalamia_admin/core/router/app_router.gr.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:alalamia_admin/core/utils/assets_manger.dart';
import 'package:alalamia_admin/modules/auth/sign_in/controllers/sign_in_cubit/sign_in_cubit.dart';
import 'package:alalamia_admin/modules/splash/controllers/splash/splash_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Import splash-specific widgets
part 'widgets/splash_listener.dart';

/// Splash screen displayed during app initialization and authentication check
/// Shows app logo and loading indicator while checking saved credentials
/// Automatically navigates to appropriate screen based on authentication status
@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

/// State class for splash view with system UI overlay management
class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // Hide status bar for fullscreen splash experience
    // Only show bottom system UI (navigation bar)
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    );
    super.initState();
  }

  @override
  void dispose() {
    // Restore all system UI overlays when leaving splash screen
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => MultiBlocProvider(
    providers: [
      // Sign in cubit for potential authentication flow
      BlocProvider(create: (final context) => di<SignInCubit>()),
      // Splash cubit with automatic startup - begins credential check
      BlocProvider(create: (final context) => di<SplashCubit>()..start()),
    ],
    child: const _SplashView(),
  );
}

/// Private splash view widget containing the UI layout
class _SplashView extends StatelessWidget {
  const _SplashView();

  @override
  Widget build(final BuildContext context) =>
      BlocListener<SplashCubit, SplashState>(
        // Listen for authentication state changes to handle navigation
        listener: _listener,
        child: Scaffold(
          // Dark blue background matching app branding
          backgroundColor: const Color(0xFF00102B),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              // App logo with Hero animation for smooth transition
              Hero(
                tag: 'logo',
                child: Image.asset(
                  AssetsManger.iconIcon,
                  height: 150.h,
                  width: 150.w,
                ),
              ),
              const Spacer(),
              // Loading indicator at bottom
              Container(
                margin: EdgeInsets.all(kLargeMargin),
                child: const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.black,
                    strokeWidth: 1,
                    strokeCap: StrokeCap.round,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
