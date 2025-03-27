import 'package:alalamia_admin/core/cubit/main_cubit.dart';
import 'package:alalamia_admin/core/localization/app_localization_controller.dart';
import 'package:alalamia_admin/core/router/app_router.dart';
import 'package:alalamia_admin/core/themes/app_theme_controller.dart';
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
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return MaterialApp.router(
          theme: AppThemeData.theme,
          darkTheme: AppThemeData.theme,
          themeMode: AppThemeController.themeMode,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.routerConfig,
          localizationsDelegates: [
            Language.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: Language.delegate.supportedLocales,
          locale: AppLocalizationController.locale,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
