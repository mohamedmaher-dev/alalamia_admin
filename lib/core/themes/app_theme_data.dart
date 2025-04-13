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
    bottomSheetTheme: BottomSheetThemeData(showDragHandle: true),
  );

  static get _pageTransitionsTheme => PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );

  static get fontFamily => 'tajawal';

  static get _expansionTileThemeData => ExpansionTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kNormalRadius),
    ),
  );

  static get _iconButtonTheme => IconButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kNormalRadius),
        ),
      ),
    ),
  );
}
