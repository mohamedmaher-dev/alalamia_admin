import 'package:flutter/material.dart';

extension BoolExt on bool {
  ThemeMode get toThemeMode => this ? ThemeMode.dark : ThemeMode.light;
  IconData get boolToIcon => this ? Icons.dark_mode : Icons.light_mode;
}
