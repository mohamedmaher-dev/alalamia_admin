import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/di/di.dart';
import 'package:alalamia_admin/core/extension/bool_ext.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'text_styles.dart';
part 'color_manger.dart';

class AppThemeData {
  AppThemeData._();
  static ThemeData get _theme => ThemeData(
    pageTransitionsTheme: _pageTransitionsTheme,
    fontFamily: fontFamily,
    expansionTileTheme: _expansionTileThemeData,
    iconButtonTheme: _iconButtonTheme,
    bottomSheetTheme: BottomSheetThemeData(showDragHandle: true),
  );
  static ThemeData get lightTheme => _theme.copyWith(
    colorScheme: ColorManger.lightColorScheme,
    scaffoldBackgroundColor: ColorManger.lightColorScheme.surface,
  );

  static ThemeData get darkTheme => _theme.copyWith(
    colorScheme: ColorManger.darkColorScheme,
    scaffoldBackgroundColor: ColorManger.darkColorScheme.surface,
  );
}

final _pageTransitionsTheme = PageTransitionsTheme(
  builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  },
);

const fontFamily = 'tajawal';

final _expansionTileThemeData = ExpansionTileThemeData(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(kNormalRadius),
  ),
);

final _iconButtonTheme = IconButtonThemeData(
  style: ButtonStyle(
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kNormalRadius),
      ),
    ),
  ),
);
