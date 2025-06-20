import 'package:flutter/material.dart';

/// Extension on bool to provide utility methods for UI theming
/// Converts boolean values to theme-related Flutter widgets and enums
extension BoolExt on bool {
  /// Convert boolean to ThemeMode for app theming
  /// Returns ThemeMode.dark if true, ThemeMode.light if false
  ThemeMode get toThemeMode => this ? ThemeMode.dark : ThemeMode.light;

  /// Convert boolean to appropriate theme icon
  /// Returns dark_mode icon if true, light_mode icon if false
  /// Used for theme toggle buttons in the UI
  IconData get boolToIcon => this ? Icons.dark_mode : Icons.light_mode;
}
