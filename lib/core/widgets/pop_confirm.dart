import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:alalamia_admin/core/widgets/general_btn.dart';
import 'package:alalamia_admin/core/widgets/outline_btn.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class _PopUpConfirm extends StatelessWidget {
  const _PopUpConfirm({
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });
  final String title;
  final String subtitle;
  final void Function() onPressed;

  @override
  Widget build(final BuildContext context) {
    final language = Language.of(context);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min, // Prevent excessive space usage
        children: [
          ListTile(
            title: Text(title, style: TextStyles.tsP15B),
            subtitle: Text(subtitle),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.all(kNormalPadding),
            child: Row(
              children: [
                Expanded(
                  child: GeneralBtn(
                    title: language.yes,
                    onPressed: () {
                      context.router.pop();
                      onPressed();
                    },
                  ),
                ),
                SizedBox(width: 10.w),
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
