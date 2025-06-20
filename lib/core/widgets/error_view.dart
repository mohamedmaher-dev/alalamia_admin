import 'package:alalamia_admin/core/themes/app_theme_data.dart';
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
  Widget build(final BuildContext context) => Column(
    // Center content vertically and stretch horizontally
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      // Error icon with red color to indicate failure
      Icon(size: 25.w, CupertinoIcons.xmark_circle, color: Colors.red),
      SizedBox(height: 5.h),
      // Error message text
      Text(
        'Something went wrong, please try again',
        style: TextStyles.tsP10N,
        textAlign: TextAlign.center,
      ),
      // Show retry button only if callback is provided
      if (onPressed != null)
        TextButton.icon(
          style: const ButtonStyle(elevation: WidgetStatePropertyAll(0)),
          onPressed: onPressed,
          label: const Text('Try Again'),
          icon: const Icon(Icons.refresh),
        ),
    ],
  );
}
