import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/di/di.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'text_styles.dart';
part 'color_manger.dart';

class AppThemeData {
  AppThemeData._();
  static ThemeData get theme => ThemeData(
    colorScheme: ColorManger._colorScheme,
    pageTransitionsTheme: _pageTransitionsTheme,
    fontFamily: fontFamily,
    expansionTileTheme: _expansionTileThemeData,
    iconButtonTheme: _iconButtonTheme,
    bottomSheetTheme: const BottomSheetThemeData(showDragHandle: true),
    listTileTheme: ListTileThemeData(
      subtitleTextStyle: TextStyles.ts10N.copyWith(color: Colors.grey),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.ts12N.copyWith(color: Colors.grey),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kNormalRadius),
      ),
    ),
  );

  static PageTransitionsTheme get _pageTransitionsTheme =>
      const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      );

  static const String fontFamily = 'Almarai';

  static ExpansionTileThemeData get _expansionTileThemeData =>
      ExpansionTileThemeData(
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kNormalRadius),
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kNormalRadius),
        ),
      );

  static IconButtonThemeData get _iconButtonTheme => IconButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kNormalRadius),
        ),
      ),
    ),
  );
}
