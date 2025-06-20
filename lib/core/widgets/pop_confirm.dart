import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:alalamia_admin/core/widgets/general_btn.dart';
import 'package:alalamia_admin/core/widgets/outline_btn.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Private widget for displaying confirmation dialog content
/// Shows title, subtitle text, and Yes/Cancel action buttons
/// Used internally by the showChangerPopUpConfirm function
class _PopUpConfirm extends StatelessWidget {
  const _PopUpConfirm({
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  /// Main title text for the confirmation dialog
  final String title;

  /// Subtitle/description text explaining the action
  final String subtitle;

  /// Callback function executed when user confirms (taps Yes)
  final void Function() onPressed;

  @override
  Widget build(final BuildContext context) {
    final language = Language.of(context);
    return Card(
      // Add margins for proper spacing within modal
      margin: EdgeInsets.symmetric(
        vertical: kLargeMargin,
        horizontal: kMediumMargin,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Prevent excessive space usage
        children: [
          // Title and subtitle section
          ListTile(
            title: Text(title, style: TextStyles.tsP15B),
            subtitle: Text(subtitle),
          ),
          // Visual separator between content and actions
          const Divider(),
          // Action buttons section
          Padding(
            padding: EdgeInsets.all(kNormalPadding),
            child: Row(
              children: [
                // Confirm/Yes button
                Expanded(
                  child: GeneralBtn(
                    title: language.yes,
                    onPressed: () {
                      // Close dialog first, then execute action
                      context.router.pop();
                      onPressed();
                    },
                  ),
                ),
                // Spacing between buttons
                SizedBox(width: 10.w),
                // Cancel button
                Expanded(
                  child: OutlineBtn(
                    color: ColorManger.red,
                    title: language.cancel,
                    onPressed: () => context.router.pop(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Show a confirmation dialog with customizable title and subtitle
/// [context] - Build context for modal presentation
/// [title] - Main title text for the dialog
/// [subtitle] - Descriptive text explaining the action
/// [onPressed] - Callback executed when user confirms the action
///
/// Uses Cupertino modal popup for iOS-style presentation
/// Returns Future that completes when dialog is dismissed
Future<void> showChangerPopUpConfirm({
  required final BuildContext context,
  required final String title,
  required final String subtitle,
  required final void Function() onPressed,
}) async {
  await showCupertinoModalPopup(
    context: context,
    builder:
        (final context) => StatefulBuilder(
          builder:
              (final context, final setState) => _PopUpConfirm(
                title: title,
                subtitle: subtitle,
                onPressed: onPressed,
              ),
        ),
  );
}
