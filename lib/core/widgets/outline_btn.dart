import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:flutter/material.dart';

/// Outline button widget with customizable border color and optional icon
/// Provides transparent background with colored border and text
/// Used for secondary actions, cancel buttons, and alternative choices
class OutlineBtn extends StatelessWidget {
  const OutlineBtn({
    super.key,
    this.onPressed,
    required this.title,
    this.icon,
    this.color = ColorManger.myGold,
  });

  /// Button text label
  final String title;

  /// Color for border, text, and icon (defaults to app's gold color)
  final Color color;

  /// Optional icon to display alongside text
  final IconData? icon;

  /// Callback function when button is pressed
  final void Function()? onPressed;

  @override
  Widget build(final BuildContext context) {
    if (icon != null) {
      // Return outline button with icon when icon is provided
      return FilledButton.icon(
        style: ButtonStyle(
          // Text and icon color matches border color
          foregroundColor: WidgetStatePropertyAll(color),
          // Transparent background for outline effect
          backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
          // Remove button elevation for flat appearance
          elevation: const WidgetStatePropertyAll(0),
          // Rounded rectangle with colored border
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kNormalRadius),
              side: BorderSide(color: color),
            ),
          ),
        ),
        onPressed: onPressed,
        // Icon with matching color
        icon: Icon(icon, color: color),
        label: Text(title),
      );
    } else {
      // Return text-only outline button when no icon is provided
      return FilledButton(
        style: ButtonStyle(
          // Text color matches border color
          foregroundColor: WidgetStatePropertyAll(color),
          // Transparent background for outline effect
          backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
          // Remove button elevation for flat appearance
          elevation: const WidgetStatePropertyAll(0),
          // Rounded rectangle with colored border
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kNormalRadius),
              side: BorderSide(color: color),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(title),
      );
    }
  }
}
