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
    this.subTitle,
    this.backgroundColor,
    this.backgroundIconColor,
    this.titleColor,
    this.trailing,
    this.onLongPress,
    this.onTap,
  });

  /// Icon widget displayed in the leading icon container
  final Widget icon;

  /// Primary text content for the list tile
  final String title;

  /// Whether the title should be displayed in bold font weight

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

  /// Callback function for long press gestures
  final void Function()? onLongPress;

  /// Callback function for tap gestures
  final void Function()? onTap;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(kNormalRadius),
      splashFactory: InkSplash.splashFactory,
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: EdgeInsets.all(kNormalPadding),
        // Add consistent margin around the list tile
        decoration: BoxDecoration(
          color: backgroundColor ?? theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(kNormalRadius),
        ),
        margin: EdgeInsets.all(kNormalMargin),
        child: Row(
          spacing: kSpacingBetweenWidgetsHight,
          children: [
            Container(
              padding: EdgeInsets.all(kNormalPadding),
              decoration: BoxDecoration(
                // Use provided icon background color or theme default
                color:
                    backgroundIconColor ??
                    theme.colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(kNormalRadius),
              ),
              child: icon,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: titleColor,
                    ),
                    maxLines: 1,
                  ),
                  if (subTitle != null)
                    Text(
                      subTitle!,
                      style: theme.textTheme.labelMedium!.copyWith(
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                    ),
                ],
              ),
            ),
            ?trailing,
          ],
        ),
      ),
    );
  }
}
