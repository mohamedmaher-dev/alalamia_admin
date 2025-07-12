part of 'app_theme_data.dart';

/// Centralized color management system for the Alalamia Admin application
/// Provides consistent color schemes for both light and dark themes
/// Manages brand colors, dynamic theming, and Material Design 3 color system
class ColorManger {
  // Private constructor to prevent instantiation
  const ColorManger._();

  // ========================================
  // BRAND & CONSTANT COLORS
  // ========================================

  /// Primary brand blue color for headers and accents
  static const Color myBlue = Color(0xff001c51);

  /// Dark blue background color for specific UI elements
  static const Color backgroundBlue = Color(0xFF00102B);

  /// Brand gold color for highlights, buttons, and important elements
  static const Color myGold = Color(0xffd2ab67);

  /// Success and positive status color
  static const Color green = Colors.green;

  /// Warning and pending status color
  static const Color orange = Colors.orange;

  /// Neutral and disabled element color
  static const Color grey = Colors.grey;

  // ========================================
  // DYNAMIC THEME CONFIGURATION
  // ========================================

  /// Get current app configuration for theme state
  static AppConfigModel get _appConfigModel => di<AppConfig>().state;

  /// Check if dark mode is currently active
  static bool get _isDark => _appConfigModel.isDarkMode;

  /// Get appropriate color scheme based on current theme mode
  static ColorScheme get _colorScheme =>
      _isDark ? darkColorScheme : lightColorScheme;

  // ========================================
  // DYNAMIC COLORS (THEME-AWARE)
  // ========================================

  /// Primary brand color that adapts to current theme
  static Color get primary => _colorScheme.primary;

  /// Error/danger color that adapts to current theme
  static Color get red => _colorScheme.error;

  // ========================================
  // LIGHT THEME COLOR SCHEME
  // ========================================
  /// Complete Material Design 3 color scheme for light theme
  /// Optimized for readability and accessibility in bright environments
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,

    // Primary Colors (Brand Gold)
    primary: Color(0xffd2ab67), // Main brand color
    onPrimary: Color(0xFFFFFFFF), // Text/icons on primary
    primaryContainer: Color(0xFF3873BA), // Primary container background
    onPrimaryContainer: Color(0xFFFFFFFF), // Text on primary container
    primaryFixed: Color(0xFFBFCFE8), // Fixed primary surface
    primaryFixedDim: Color(0xFF8CA8D3), // Dimmed primary surface
    onPrimaryFixed: Color(0xFF000307), // Text on fixed primary
    onPrimaryFixedVariant: Color(0xFF000A19), // Variant text on primary
    // Secondary Colors (Also Gold for consistency)
    secondary: Color(0xffd2ab67), // Secondary accent color
    onSecondary: Color(0xFFFFFFFF), // Text on secondary
    secondaryContainer: Color(0xFFFFD270), // Secondary container
    onSecondaryContainer: Color(0xFF000000), // Text on secondary container
    secondaryFixed: Color(0xFFFEDEBF), // Fixed secondary surface
    secondaryFixedDim: Color(0xFFF3C08C), // Dimmed secondary surface
    onSecondaryFixed: Color(0xFF4F2800), // Text on fixed secondary
    onSecondaryFixedVariant: Color(0xFF613000), // Variant text on secondary
    // Tertiary Colors (Blue accents)
    tertiary: Color(0xFF5C5C95), // Tertiary accent color
    onTertiary: Color(0xFFFFFFFF), // Text on tertiary
    tertiaryContainer: Color(0xFFC8DBF8), // Tertiary container
    onTertiaryContainer: Color(0xFF000000), // Text on tertiary container
    tertiaryFixed: Color(0xFFDBDBE9), // Fixed tertiary surface
    tertiaryFixedDim: Color(0xFFB7B7D2), // Dimmed tertiary surface
    onTertiaryFixed: Color(0xFF27273E), // Text on fixed tertiary
    onTertiaryFixedVariant: Color(0xFF2D2D4A), // Variant text on tertiary
    // Error Colors
    error: Color(0xFFB00020), // Error/danger color
    onError: Color(0xFFFFFFFF), // Text on error background
    errorContainer: Color(0xFFFCD9DF), // Error container background
    onErrorContainer: Color(0xFF000000), // Text on error container
    // Surface Colors (Backgrounds and containers)
    surface: Color(0xFFF5F5F5), // Main background surface
    onSurface: Color(0xFF111111), // Text on main surface
    surfaceDim: Color(0xFFE0E0E0), // Dimmed surface variant
    surfaceBright: Color(0xFFFDFDFD), // Bright surface variant
    surfaceContainerLowest: Color(0xFFFFFFFF), // Lowest elevation container
    surfaceContainerLow: Color(0xFFFFFFFF), // Card backgrounds
    surfaceContainer: Color(0xFFF3F3F3), // Standard container background
    surfaceContainerHigh: Color(0xFFEDEDED), // High elevation container
    surfaceContainerHighest: Color(0xFFE7E7E7), // Text form field backgrounds
    // On Surface Colors (Text and icons on surfaces)
    onSurfaceVariant: Color(0xFF393939), // Secondary text color
    outline: Color(0xFF919191), // Border and outline color
    outlineVariant: Color(0xFFD1D1D1), // Variant outline color
    // Special Colors
    shadow: Color(0xFF000000), // Drop shadow color
    scrim: Color(0xFF000000), // Modal overlay color
    inverseSurface: Color(0xFF2A2A2A), // Inverse surface for contrast
    onInverseSurface: Color(0xFFF1F1F1), // Text on inverse surface
    inversePrimary: Color(0xFF8DACDD), // Inverse primary color
    surfaceTint: Color(0xFF00296B), // Surface tint for elevation
  );

  // ========================================
  // DARK THEME COLOR SCHEME
  // ========================================
  /// Complete Material Design 3 color scheme for dark theme
  /// Optimized for readability and reduced eye strain in low-light environments
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,

    // Primary Colors (Brand Gold)
    primary: Color(0xffd2ab67), // Main brand color
    onPrimary: Color(0xFF000000), // Text/icons on primary
    primaryContainer: Color(0xFF3873BA), // Primary container background
    onPrimaryContainer: Color(0xFFFFFFFF), // Text on primary container
    primaryFixed: Color(0xFFBFCFE8), // Fixed primary surface
    primaryFixedDim: Color(0xFF8CA8D3), // Dimmed primary surface
    onPrimaryFixed: Color(0xFF000307), // Text on fixed primary
    onPrimaryFixedVariant: Color(0xFF000A19), // Variant text on primary
    // Secondary Colors (Gold consistency)
    secondary: Color(0xffd2ab67), // Secondary accent color
    onSecondary: Color(0xFF000000), // Text on secondary
    secondaryContainer: Color(0xffd2ab67), // Secondary container
    onSecondaryContainer: Color(0xFFFFFFFF), // Text on secondary container
    secondaryFixed: Color(0xFFFEDEBF), // Fixed secondary surface
    secondaryFixedDim: Color(0xffd2ab67), // Dimmed secondary surface
    onSecondaryFixed: Color(0xFF4F2800), // Text on fixed secondary
    onSecondaryFixedVariant: Color(0xFF613000), // Variant text on secondary
    // Tertiary Colors (Light blue for dark theme)
    tertiary: Color(0xFFC9CBFC), // Tertiary accent color
    onTertiary: Color(0xFF000000), // Text on tertiary
    tertiaryContainer: Color(0xFF535393), // Tertiary container
    onTertiaryContainer: Color(0xFFFFFFFF), // Text on tertiary container
    tertiaryFixed: Color(0xFFDBDBE9), // Fixed tertiary surface
    tertiaryFixedDim: Color(0xFFB7B7D2), // Dimmed tertiary surface
    onTertiaryFixed: Color(0xFF27273E), // Text on fixed tertiary
    onTertiaryFixedVariant: Color(0xFF2D2D4A), // Variant text on tertiary
    // Error Colors (Adjusted for dark theme)
    error: Color(0xFFCF6679), // Error/danger color
    onError: Color(0xFF000000), // Text on error background
    errorContainer: Color(0xFFB1384E), // Error container background
    onErrorContainer: Color(0xFFFFFFFF), // Text on error container
    // Surface Colors (Dark backgrounds and containers)
    surface: Color(0xff181a1d), // Scaffold background
    onSurface: Color(0xFFF1F1F1), // Text on main surface
    surfaceDim: Color(0xFF060606), // Dimmed surface variant
    surfaceBright: Color(0xFF2C2C2C), // Bright surface variant
    surfaceContainerLowest: Color(0xFF010101), // Lowest elevation container
    surfaceContainerLow: Color(0xff232629), // Card backgrounds
    surfaceContainer: Color(0xFF151515), // Standard container background
    surfaceContainerHigh: Color(0xFF1D1D1D), // High elevation container
    surfaceContainerHighest: Color(0xff3d4146), // Text form field backgrounds
    // On Surface Colors (Text and icons on dark surfaces)
    onSurfaceVariant: Color(0xFFFFFFFF), // Secondary text color
    outline: Color(0xFF777777), // Border and outline color
    outlineVariant: Color(0xFF414141), // Variant outline color
    // Special Colors
    shadow: Color(0xFF000000), // Drop shadow color
    scrim: Color(0xFF000000), // Modal overlay color
    inverseSurface: Color(0xFFE8E8E8), // Inverse surface for contrast
    onInverseSurface: Color(0xFF2A2A2A), // Text on inverse surface
    inversePrimary: Color(0xFF515D6B), // Inverse primary color
    surfaceTint: Color(0xFFB1CFF5), // Surface tint for elevation
  );
}
