import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// Global loading overlay utility using EasyLoading package
/// Provides consistent loading indicators across the entire application
/// Shows full-screen loading with backdrop to prevent user interaction
class PopLoading {
  // Private constructor to prevent instantiation
  PopLoading._();

  /// Initialize EasyLoading for global loading functionality
  /// Returns TransitionBuilder to integrate with MaterialApp
  /// Should be called in MaterialApp.builder during app setup
  static TransitionBuilder init() => EasyLoading.init();

  /// Show global loading overlay with custom styling
  /// Displays loading indicator with dark backdrop to block user interaction
  /// Uses app's brand color (gold) for the loading indicator
  static void show() {
    EasyLoading.show(
      // Dark mask to prevent interaction with background
      maskType: EasyLoadingMaskType.black,
      // Prevent dismissal by tapping outside
      dismissOnTap: false,
      // Custom loading indicator with app branding
      indicator: const CircularProgressIndicator(
        strokeWidth: 2,
        color: ColorManger.myGold,
      ),
    );
  }

  /// Dismiss the currently displayed loading overlay
  /// Returns Future that completes when dismissal animation finishes
  static Future<void> dismiss() => EasyLoading.dismiss();
}
