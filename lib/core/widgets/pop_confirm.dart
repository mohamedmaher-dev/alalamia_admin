import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:alalamia_admin/core/widgets/general_btn.dart';
import 'package:alalamia_admin/core/widgets/outline_btn.dart';
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
  Widget build(BuildContext context) {
    final language = Language.of(context);
    return Container(
      padding: EdgeInsets.all(10.w),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Prevent excessive space usage
          children: [
            ListTile(
              title: Text(title, style: TextStyles.tsP15B),
              subtitle: Text(subtitle),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(kNormalPadding),
              child: Row(
                children: [
                  Expanded(
                    child: GeneralBtn(
                      title: language.yes,
                      onPressed: onPressed,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: OutlineBtn(
                      color: Colors.red,
                      title: language.cancel,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> showChangerPopUpConfirm({
  required BuildContext context,
  required String title,
  required String subtitle,
  required void Function() onPressed,
}) async {
  await showCupertinoModalPopup(
    context: context,
    builder:
        (context) => StatefulBuilder(
          builder: (context, setState) {
            return _PopUpConfirm(
              title: title,
              subtitle: subtitle,
              onPressed: onPressed,
            );
          },
        ),
  );
}
