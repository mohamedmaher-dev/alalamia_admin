part of 'app_theme_data.dart';

class TextStyles {
  static String get fontFamily => AppThemeData.fontFamily;
  const TextStyles._();

  // Bold
  static TextStyle get ts15B => TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
  );
  static TextStyle get ts12B => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
  );

  // Primary Color - Bold
  static TextStyle get tsP30B => TextStyle(
    color: ColorManger.primary,
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
  );

  static TextStyle get tsP15B => TextStyle(
    color: ColorManger.primary,
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
  );

  // Primary Color - Normal
  static TextStyle get tsP10N => TextStyle(
    color: ColorManger.primary,
    fontSize: 10.sp,
    fontWeight: FontWeight.normal,
    fontFamily: fontFamily,
  );
}
