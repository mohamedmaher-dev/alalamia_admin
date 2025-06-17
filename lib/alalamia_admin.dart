import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/extension/bool_ext.dart';
import 'package:alalamia_admin/core/extension/string_ext.dart';
import 'package:alalamia_admin/core/router/app_router.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/widgets/app_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/localization/generated/l10n.dart';

/// The main application widget for Alalamia Admin
/// This class serves as the root widget that sets up the MaterialApp with
/// routing, theming, localization, and other core app configurations.
class AlalamiaAdmin extends StatelessWidget {
  const AlalamiaAdmin({super.key});

  @override
  Widget build(final BuildContext context) =>
  // Listen to app configuration changes using BlocBuilder
  BlocBuilder<AppConfig, AppConfigModel>(
    builder:
        (final _, final config) => MaterialApp.router(
          // Set the app theme (light and dark themes are the same)
          theme: AppThemeData.theme,
          darkTheme: AppThemeData.theme,
          // Apply theme mode based on user's dark mode preference
          themeMode: config.isDarkMode.toThemeMode,
          // Disable the debug banner in release builds
          debugShowCheckedModeBanner: false,
          // Configure app routing using auto_route
          routerConfig: AppRouter.instance.config(),
          // Set up localization delegates for multi-language support
          localizationsDelegates: const [
            Language.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          // Define supported locales for the app
          supportedLocales: Language.delegate.supportedLocales,
          // Set current locale based on user's language preference
          locale: config.language.stringToLocale,
          // Builder to initialize global app components
          builder: (final context, final child) {
            // Initialize the global snack bar context
            AppSnackBar.init(context);
            // Initialize EasyLoading for showing loading indicators
            return EasyLoading.init()(context, child);
          },
        ),
  );
}
