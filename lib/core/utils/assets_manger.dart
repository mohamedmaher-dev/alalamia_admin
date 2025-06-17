// ignore_for_file: prefer_single_quotes

/// Central assets manager for the Alalamia Admin application
/// Provides type-safe access to all asset file paths used throughout the app
/// Generated constants ensure asset paths are correct and help prevent typos
class AssetsManger {
  // Private constructor to prevent instantiation
  AssetsManger._();

  // Font Assets

  /// Assets for fontsAlmaraiRegular
  /// Arabic font family used throughout the application
  /// assets/fonts/Almarai-Regular.ttf
  static const String fontsAlmaraiRegular = "assets/fonts/Almarai-Regular.ttf";

  // App Icon Assets

  /// Assets for iconBackground
  /// Background image for app icon and splash screen
  /// assets/icon/background.png
  static const String iconBackground = "assets/icon/background.png";

  /// Assets for iconIcon
  /// Main application icon image
  /// assets/icon/icon.png
  static const String iconIcon = "assets/icon/icon.png";

  // Image Assets

  /// Assets for imagesGlobal
  /// Global/international flag or icon
  /// assets/images/global.png
  static const String imagesGlobal = "assets/images/global.png";

  /// Assets for imagesHorizontalLogo
  /// Alalamia horizontal logo for branding
  /// assets/images/horizontal_logo.png
  static const String imagesHorizontalLogo =
      "assets/images/horizontal_logo.png";

  /// Assets for imagesKsa
  /// Kingdom of Saudi Arabia flag image
  /// assets/images/ksa.png
  static const String imagesKsa = "assets/images/ksa.png";

  /// Assets for imagesKsaCurrency
  /// Saudi Riyal currency symbol (SVG format)
  /// assets/images/ksa_currency.svg
  static const String imagesKsaCurrency = "assets/images/ksa_currency.svg";

  /// Assets for imagesUae
  /// United Arab Emirates flag image
  /// assets/images/uae.png
  static const String imagesUae = "assets/images/uae.png";
}
