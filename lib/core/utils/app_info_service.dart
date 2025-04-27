import 'package:package_info_plus/package_info_plus.dart';

class AppInfoService {
  AppInfoService._();
  static late PackageInfo _packageInfo;
  static Future<void> init() async =>
      _packageInfo = await PackageInfo.fromPlatform();
  static String get appName => _packageInfo.appName;
  static String get packageName => _packageInfo.packageName;
  static String get version => _packageInfo.version;
  static String get buildNumber => _packageInfo.buildNumber;
  static String get buildSignature => _packageInfo.buildSignature;
  static String? get installerStore => _packageInfo.installerStore;
  static DateTime? get installTime => _packageInfo.installTime;
  static DateTime? get updateTime => _packageInfo.updateTime;
}
