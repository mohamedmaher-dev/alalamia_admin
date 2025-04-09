import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/extension/bool_ext.dart';
import 'package:alalamia_admin/core/extension/string_ext.dart';
import 'package:alalamia_admin/core/router/app_router.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/localization/generated/l10n.dart';

class AlalamiaAdmin extends StatelessWidget {
  const AlalamiaAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppConfig, AppConfigModel>(
      builder: (context, config) {
        return MaterialApp.router(
          theme: AppThemeData.lightTheme,
          darkTheme: AppThemeData.darkTheme,
          themeMode: config.isDarkMode.toThemeMode,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.routerConfig,
          localizationsDelegates: [
            Language.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: Language.delegate.supportedLocales,
          locale: config.language.stringToLocale,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
