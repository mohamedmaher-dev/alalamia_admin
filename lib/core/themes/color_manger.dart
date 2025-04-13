part of 'app_theme_data.dart';

class ColorManger {
  const ColorManger._();
  // Consts colors
  static const Color myBlue = Color(0xff001c51);
  static const Color backgroundBlue = Color(0xFF00102B);
  static const Color myGold = Color(0xffd2ab67);
  static const Color green = Colors.green;
  static const Color orange = Colors.orange;
  static const Color grey = Colors.grey;
  // App Config
  static AppConfigModel get _appConfigModel => di<AppConfig>().state;
  // Get ThemeMode
  static bool get _isDark => _appConfigModel.isDarkMode;
  // Get ColorScheme
  static ColorScheme get _colorScheme =>
      _isDark ? darkColorScheme : lightColorScheme;
  // Daynamic Colors
  static Color get primary => _colorScheme.primary;
  static Color get red => _colorScheme.error;
  // Light ColorScheme
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xffd2ab67),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF3873BA),
    onPrimaryContainer: Color(0xFFFFFFFF),
    primaryFixed: Color(0xFFBFCFE8),
    primaryFixedDim: Color(0xFF8CA8D3),
    onPrimaryFixed: Color(0xFF000307),
    onPrimaryFixedVariant: Color(0xFF000A19),
    secondary: Color(0xffd2ab67),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFFFD270),
    onSecondaryContainer: Color(0xFF000000),
    secondaryFixed: Color(0xFFFEDEBF),
    secondaryFixedDim: Color(0xFFF3C08C),
    onSecondaryFixed: Color(0xFF4F2800),
    onSecondaryFixedVariant: Color(0xFF613000),
    tertiary: Color(0xFF5C5C95),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFC8DBF8),
    onTertiaryContainer: Color(0xFF000000),
    tertiaryFixed: Color(0xFFDBDBE9),
    tertiaryFixedDim: Color(0xFFB7B7D2),
    onTertiaryFixed: Color(0xFF27273E),
    onTertiaryFixedVariant: Color(0xFF2D2D4A),
    error: Color(0xFFB00020),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFCD9DF),
    onErrorContainer: Color(0xFF000000),
    // Background
    surface: Color(0xFFF5F5F5),
    onSurface: Color(0xFF111111),
    surfaceDim: Color(0xFFE0E0E0),
    surfaceBright: Color(0xFFFDFDFD),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    // Card Background
    surfaceContainerLow: Color(0xFFFFFFFF),
    surfaceContainer: Color(0xFFF3F3F3),
    surfaceContainerHigh: Color(0xFFEDEDED),
    // Text Form Field Background
    surfaceContainerHighest: Color(0xFFE7E7E7),
    onSurfaceVariant: Color(0xFF393939),
    outline: Color(0xFF919191),
    outlineVariant: Color(0xFFD1D1D1),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFF2A2A2A),
    onInverseSurface: Color(0xFFF1F1F1),
    inversePrimary: Color(0xFF8DACDD),
    surfaceTint: Color(0xFF00296B),
  );
  // Dark ColorScheme
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xffd2ab67),
    onPrimary: Color(0xFF000000),
    primaryContainer: Color(0xFF3873BA),
    onPrimaryContainer: Color(0xFFFFFFFF),
    primaryFixed: Color(0xFFBFCFE8),
    primaryFixedDim: Color(0xFF8CA8D3),
    onPrimaryFixed: Color(0xFF000307),
    onPrimaryFixedVariant: Color(0xFF000A19),
    secondary: Color(0xffd2ab67),
    onSecondary: Color(0xFF000000),
    secondaryContainer: Color(0xffd2ab67),
    onSecondaryContainer: Color(0xFFFFFFFF),
    secondaryFixed: Color(0xFFFEDEBF),
    secondaryFixedDim: Color(0xffd2ab67),
    onSecondaryFixed: Color(0xFF4F2800),
    onSecondaryFixedVariant: Color(0xFF613000),
    tertiary: Color(0xFFC9CBFC),
    onTertiary: Color(0xFF000000),
    tertiaryContainer: Color(0xFF535393),
    onTertiaryContainer: Color(0xFFFFFFFF),
    tertiaryFixed: Color(0xFFDBDBE9),
    tertiaryFixedDim: Color(0xFFB7B7D2),
    onTertiaryFixed: Color(0xFF27273E),
    onTertiaryFixedVariant: Color(0xFF2D2D4A),
    error: Color(0xFFCF6679),
    onError: Color(0xFF000000),
    errorContainer: Color(0xFFB1384E),
    onErrorContainer: Color(0xFFFFFFFF),
    // Scaffold Background
    surface: Color(0xff181a1d),
    onSurface: Color(0xFFF1F1F1),
    surfaceDim: Color(0xFF060606),
    surfaceBright: Color(0xFF2C2C2C),
    surfaceContainerLowest: Color(0xFF010101),
    // Card Background
    surfaceContainerLow: Color(0xff232629),
    surfaceContainer: Color(0xFF151515),
    surfaceContainerHigh: Color(0xFF1D1D1D),
    // Text Form Field Background
    surfaceContainerHighest: Color(0xff3d4146),
    onSurfaceVariant: Color(0xFFCACACA),
    outline: Color(0xFF777777),
    outlineVariant: Color(0xFF414141),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFFE8E8E8),
    onInverseSurface: Color(0xFF2A2A2A),
    inversePrimary: Color(0xFF515D6B),
    surfaceTint: Color(0xFFB1CFF5),
  );
}
