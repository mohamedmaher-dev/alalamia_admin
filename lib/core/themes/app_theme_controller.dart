import 'package:alalamia_admin/core/local_storage/local_storage_service.dart';
import 'package:flutter/material.dart';

class AppThemeController {
  final LocalStorageService _localStorageService;
  static late ThemeMode themeMode;
  AppThemeController(this._localStorageService);
  Future<void> init() async {
    final appSettingsModel = _localStorageService.getAppSettings;
    if (appSettingsModel.isDark == true) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
  }

  Future<void> changeThemeMode() async {
    final appSettingsModel = _localStorageService.getAppSettings;
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await _localStorageService.saveAppSettings(
      appSettingsModel: appSettingsModel.copyWith(
        isDark: themeMode == ThemeMode.dark,
      ),
    );
  }
}
