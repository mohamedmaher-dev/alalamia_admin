import 'package:alalamia_admin/core/local_storage/hive_adapter_type.dart';
import 'package:flutter/painting.dart';
import 'package:hive/hive.dart';

part 'app_settings_model.g.dart';

@HiveType(typeId: HiveAdapterType.appSettingsModel)
class AppSettingsModel {
  @HiveField(0)
  final String languageCode;
  @HiveField(1)
  final bool isDark;
  AppSettingsModel({required this.languageCode, required this.isDark});

  AppSettingsModel copyWith({String? locale, bool? isDark}) {
    return AppSettingsModel(
      languageCode: locale ?? languageCode,
      isDark: isDark ?? this.isDark,
    );
  }

  static Locale get defaultLocal => Locale('ar');
  static bool get defaultIsDark => true;
  static AppSettingsModel defaultModel = AppSettingsModel(
    languageCode: defaultLocal.languageCode,
    isDark: defaultIsDark,
  );
}
