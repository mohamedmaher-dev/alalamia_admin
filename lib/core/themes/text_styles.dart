part of 'app_theme_data.dart';

/// Centralized text styles for consistent typography across the application
/// Provides predefined text styles with responsive sizing and app font family
/// Naming convention: ts[Color][Size][Weight] (e.g., tsP15B = Primary, 15sp, Bold)
class TextStyles {
  /// Get the app's primary font family
  static String get fontFamily => AppThemeData.fontFamily;

  // Private constructor to prevent instantiation
  const TextStyles._();

  // ========================================
  // STANDARD TEXT STYLES (No Color Override)
  // ========================================

  /// Bold text style - 15sp font size
  /// Used for section headers, important labels, and emphasized text
  static TextStyle get ts15B => TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
  );

  /// Bold text style - 12sp font size
  /// Used for button text, small headers, and compact bold content
  static TextStyle get ts12B => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
  );

  // ========================================
  // PRIMARY COLOR TEXT STYLES (Bold)
  // ========================================

  /// Primary color bold text - 30sp font size
  /// Used for main titles, page headers, and prominent branding text
  static TextStyle get tsP30B => TextStyle(
    color: ColorManger.primary,
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
  );

  /// Primary color bold text - 15sp font size
  /// Used for section titles, important information, and highlighted content
  static TextStyle get tsP15B => TextStyle(
    color: ColorManger.primary,
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
  );

  // ========================================
  // PRIMARY COLOR TEXT STYLES (Normal Weight)
  // ========================================

  /// Primary color normal text - 10sp font size
  /// Used for small details, captions, and secondary information in primary color
  static TextStyle get tsP10N => TextStyle(
    color: ColorManger.primary,
    fontSize: 10.sp,
    fontWeight: FontWeight.normal,
    fontFamily: fontFamily,
  );
}
