import 'package:alalamia_admin/core/local_storage/local_storage_service.dart';
import 'package:flutter/material.dart';

class AppLocalizationController {
  static late Locale locale;
  final LocalStorageService _localStorageService;
  AppLocalizationController(this._localStorageService);
  Future<void> init() async {
    final appSettingsModel = _localStorageService.getAppSettings;
    locale = Locale(appSettingsModel.languageCode);
  }

  Future<void> changeLanguage() async {
    final appSettingsModel = _localStorageService.getAppSettings;
    locale = newLanguage(locale.languageCode);
    await _localStorageService.saveAppSettings(
      appSettingsModel: appSettingsModel.copyWith(locale: locale.languageCode),
    );
  }

  Locale newLanguage(String languageCode) {
    if (locale.languageCode == 'ar') {
      return Locale('en');
    } else {
      return Locale('ar');
    }
  }
}
