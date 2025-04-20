import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:flutter/material.dart';

class GeneralBtn extends StatelessWidget {
  const GeneralBtn({super.key, this.onPressed, required this.title, this.icon});
  final String title;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return FilledButton.icon(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(Colors.black),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kNormalRadius),
            ),
          ),
        ),
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.black),
        label: Text(title),
      );
    } else {
      return FilledButton(
        style: ButtonStyle(
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
