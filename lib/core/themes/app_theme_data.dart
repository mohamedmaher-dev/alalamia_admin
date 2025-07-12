import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/di/di.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Import theme-related parts
part 'text_styles.dart';
part 'color_manger.dart';

/// Central theme configuration class for the Alalamia Admin application
/// Defines the visual appearance, colors, typography, and component styling
/// Uses Material Design 3 principles with custom branding and Arabic font support
class AppThemeData {
  // Private constructor to prevent instantiation
  AppThemeData._();

  /// Main application theme configuration
  /// Combines custom colors, typography, and component styles
  /// Used consistently across the entire application
  static ThemeData get theme => ThemeData(
    // Custom color scheme based on app branding
    colorScheme: ColorManger._colorScheme,
    // Smooth page transitions for better UX
    pageTransitionsTheme: _pageTransitionsTheme,
    // Arabic font family for proper text rendering
    fontFamily: fontFamily,
    // Expansion tile styling with rounded corners
    expansionTileTheme: _expansionTileThemeData,
    // Icon button styling with consistent border radius
    iconButtonTheme: _iconButtonTheme,
    // Bottom sheet with drag handle for better UX
    bottomSheetTheme: const BottomSheetThemeData(showDragHandle: true),
    // List tile with custom subtitle styling
    listTileTheme: const ListTileThemeData(
      subtitleTextStyle: TextStyle(color: Colors.grey, fontFamily: fontFamily),
    ),
    // Input field styling with grey hint text
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey),
    ),
    // Button styling with rounded corners
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kNormalRadius),
      ),
    ),
  );

  /// Configure smooth page transitions for both Android and iOS
  /// Uses Cupertino-style transitions for consistent feel across platforms
  static PageTransitionsTheme get _pageTransitionsTheme =>
      const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      );

  /// Primary font family for Arabic and English text
  /// Almarai font provides excellent Arabic text rendering
  static const String fontFamily = 'Almarai';

  /// Expansion tile theme with consistent rounded corners
  /// Applied to both collapsed and expanded states
  static ExpansionTileThemeData get _expansionTileThemeData =>
      ExpansionTileThemeData(
        // Styling for collapsed expansion tiles
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kNormalRadius),
        ),
        // Styling for expanded expansion tiles
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kNormalRadius),
        ),
      );

  /// Icon button theme with consistent rounded corners
  /// Ensures all icon buttons follow the same design pattern
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
