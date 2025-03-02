import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:flutter/material.dart';

class OutlineBtn extends StatelessWidget {
  const OutlineBtn({
    super.key,
    this.onPressed,
    required this.title,
    this.icon,
    this.color = ColorManger.myGold,
  });
  final String title;
  final Color color;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return FilledButton.icon(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(color),
          backgroundColor: WidgetStatePropertyAll(ColorManger.transparent),
          elevation: WidgetStatePropertyAll(0),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kNormalRadius),
              side: BorderSide(color: color, width: 1),
            ),
          ),
        ),
        onPressed: onPressed,
        icon: Icon(icon, color: color),
        label: Text(title),
      );
    } else {
      return FilledButton(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(color),
          backgroundColor: WidgetStatePropertyAll(ColorManger.transparent),
          elevation: WidgetStatePropertyAll(0),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kNormalRadius),
              side: BorderSide(color: color, width: 1),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(title),
      );
    }
  }
}
