import 'package:package_info_plus/package_info_plus.dart';

/// Service for accessing application metadata and package information
/// Provides static access to app details like version, build number, and installation info
/// Must be initialized during app startup before accessing any properties
class AppInfoService {
  // Private constructor to prevent instantiation
  AppInfoService._();

  /// Internal package info instance containing app metadata
  static late PackageInfo _packageInfo;

  /// Initialize the service by fetching package information from platform
  /// Must be called once during app startup, typically in main()
  static Future<void> init() async =>
      _packageInfo = await PackageInfo.fromPlatform();

  /// Get the application display name
  /// Example: "Alalamia Admin"
  static String get appName => _packageInfo.appName;

  /// Get the application package/bundle identifier
  /// Example: "com.alalamia.admin"
  static String get packageName => _packageInfo.packageName;

  /// Get the application version string
  /// Example: "1.0.0"
  static String get version => _packageInfo.version;

  /// Get the application build number
  /// Example: "123"
  static String get buildNumber => _packageInfo.buildNumber;

  /// Get the build signature for app verification
  static String get buildSignature => _packageInfo.buildSignature;

  /// Get the store where the app was installed from (if available)
  /// Example: "com.android.vending" for Google Play Store
  static String? get installerStore => _packageInfo.installerStore;

  /// Get the timestamp when the app was first installed
  static DateTime? get installTime => _packageInfo.installTime;

  /// Get the timestamp when the app was last updated
  static DateTime? get updateTime => _packageInfo.updateTime;
}
