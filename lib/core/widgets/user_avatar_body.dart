import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// User avatar widget displaying the first letter of a username
/// Creates a circular/rounded avatar with colored background and contrasting text
/// Used in order lists, user cards, and profile displays
class UserAvatarBody extends StatelessWidget {
  const UserAvatarBody({
    super.key,
    required this.userName,
    this.color = ColorManger.myGold,
  });

  /// Color scheme for the avatar (background tint and text color)
  final Color color;

  /// Username from which to extract the first letter for display
  final String userName;

  @override
  Widget build(final BuildContext context) => Initicon(
    // Responsive size using ScreenUtil
    size: 35.r,
    // Extract and capitalize first letter of username
    text: userName.substring(0, 1).toUpperCase(),
    // Semi-transparent background using the accent color
    backgroundColor: color.withAlpha(kBackgroundColorAlpha),
    // Rounded corners matching app's design language
    borderRadius: BorderRadius.circular(kNormalRadius),
    // Text styling with app font and bold weight
    style: TextStyle(
      fontFamily: AppThemeData.fontFamily,
      color: color,
      fontWeight: FontWeight.bold,
    ),
  );
}
