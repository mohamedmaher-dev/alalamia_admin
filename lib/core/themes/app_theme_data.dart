import 'package:alalamia_admin/core/themes/app_theme_controller.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'text_styles.dart';
part 'color_manger.dart';

class AppThemeData {
  AppThemeData._();
  static ThemeData get theme => ThemeData(
    colorScheme: ColorManger.colorScheme,
    pageTransitionsTheme: _pageTransitionsTheme,
    fontFamily: fontFamily,
    expansionTileTheme: _expansionTileThemeData,
    // listTileTheme: ListTileThemeData(titleTextStyle: TextStyles.tsP12B),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kNormalRadius),
          ),
        ),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(showDragHandle: true),
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
