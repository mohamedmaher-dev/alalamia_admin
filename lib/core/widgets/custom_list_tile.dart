import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:flutter/material.dart';

/// Highly customizable list tile widget with consistent styling
/// Provides icon container, title/subtitle text, and trailing widget support
/// Used throughout the app for settings, navigation, and information display
class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    this.titleIsBold,
    this.isDense,
    this.subTitle,
    this.backgroundColor,
    this.backgroundIconColor,
    this.titleColor,
    this.trailing,
    this.onLongPress,
    this.onTap,
    this.titleDirection,
  });

  /// Icon widget displayed in the leading icon container
  final Widget icon;

  /// Primary text content for the list tile
  final String title;

  /// Whether the title should be displayed in bold font weight
  final bool? titleIsBold;

  /// Whether the list tile should use dense (compact) layout
  final bool? isDense;

  /// Optional secondary text displayed below the title
  final String? subTitle;

  /// Background color for the entire list tile
  final Color? backgroundColor;

  /// Background color for the icon container
  final Color? backgroundIconColor;

  /// Text color for the title
  final Color? titleColor;

  /// Widget displayed on the right side of the list tile
  final Widget? trailing;

  /// Text direction for the title (useful for RTL languages)
  final TextDirection? titleDirection;

  /// Callback function for long press gestures
  final void Function()? onLongPress;

  /// Callback function for tap gestures
  final void Function()? onTap;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      // Add consistent margin around the list tile
      margin: EdgeInsets.all(kNormalMargin),
      child: ListTile(
        // Use provided background color or theme default
        tileColor: backgroundColor ?? theme.colorScheme.surface,
        // Rounded corners for modern appearance
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kNormalRadius),
        ),
        // Consistent horizontal padding
        contentPadding: EdgeInsets.symmetric(horizontal: kNormalPadding),
        // Apply dense layout if specified
        dense: isDense,
        // Leading icon with styled container
        leading: Container(
          padding: EdgeInsets.all(kNormalPadding),
          decoration: BoxDecoration(
            // Use provided icon background color or theme default
            color: backgroundIconColor ?? theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(kNormalRadius),
          ),
          child: icon,
        ),
        // Title with optional styling
        title: Text(
          title,
          style: TextStyle(
            // Apply bold font weight if specified
            fontWeight: titleIsBold == true ? FontWeight.bold : null,
            // Use custom title color if provided
            color: titleColor,
          ),
          // Support custom text direction for internationalization
          textDirection: titleDirection,
        ),
        // Optional subtitle with grey color
        subtitle:
            subTitle == null
                ? null
                : Text(subTitle!, style: const TextStyle(color: Colors.grey)),
        // Optional trailing widget
        trailing: trailing,
        // Gesture handlers
        onLongPress: onLongPress,
        onTap: onTap,
      ),
    );
  }
}
