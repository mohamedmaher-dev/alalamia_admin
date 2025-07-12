import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Error state widget for displaying failure messages with optional retry functionality
/// Shows a centered error icon, message, and optional retry button
/// Used throughout the app when API calls or operations fail
class ErrorView extends StatelessWidget {
  const ErrorView({super.key, this.onPressed});

  /// Optional callback for retry action when user taps "Try Again"
  /// If null, no retry button is shown
  final void Function()? onPressed;

  @override
  Widget build(final BuildContext context) {
    final language = Language.of(context);
    return Column(
      spacing: kSpacingBetweenWidgetsHight,
      // Center content vertically and stretch horizontally
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Error icon with red color to indicate failure
        Icon(
          size: 50.w,
          CupertinoIcons.xmark_circle,
          color: Theme.of(context).colorScheme.error,
        ),
        Text(
          language.something_went_wrong_please_try_again,
          style: TextStyle(
            fontSize: 12.sp,
            color: Theme.of(context).colorScheme.error,
          ),
          textAlign: TextAlign.center,
        ),
        // Show retry button only if callback is provided
        if (onPressed != null)
          Align(
            child: TextButton(
              style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kNormalRadius),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(
                  ColorManger.myGold.withAlpha(kBackgroundColorAlpha),
                ),
              ),
              onPressed: onPressed,
              child: Text(language.try_again),
            ),
          ),
      ],
    );
  }
}
