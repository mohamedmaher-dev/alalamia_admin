import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:flutter/material.dart';

/// General purpose button widget with consistent styling across the app
/// Supports both text-only and icon+text configurations
/// Uses filled button style with rounded corners matching app theme
class GeneralBtn extends StatelessWidget {
  const GeneralBtn({super.key, this.onPressed, required this.title, this.icon});

  /// Button text label
  final String title;

  /// Optional icon to display alongside text
  final IconData? icon;

  /// Callback function when button is pressed
  final void Function()? onPressed;

  @override
  Widget build(final BuildContext context) {
    if (icon != null) {
      // Return icon button when icon is provided
      return FilledButton.icon(
        style: ButtonStyle(
          // Black text color for better contrast
          foregroundColor: const WidgetStatePropertyAll(Colors.black),
          // Rounded corners consistent with app theme
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kNormalRadius),
            ),
          ),
        ),
        onPressed: onPressed,
        // Icon with black color for consistency
        icon: Icon(icon, color: Colors.black),
        label: Text(title),
      );
    } else {
      // Return text-only button when no icon is provided
      return FilledButton(
        style: ButtonStyle(
          // Rounded corners consistent with app theme
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kNormalRadius),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(title),
      );
    }
  }
}
