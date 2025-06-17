import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:flutter/material.dart';

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
  final Widget icon;
  final String title;
  final bool? titleIsBold, isDense;
  final String? subTitle;
  final Color? backgroundColor, backgroundIconColor, titleColor;
  final Widget? trailing;
  final TextDirection? titleDirection;
  final void Function()? onLongPress;
  final void Function()? onTap;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.all(kNormalMargin),
      child: ListTile(
        tileColor: backgroundColor ?? theme.colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kNormalRadius),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: kNormalPadding),
        dense: isDense,
        leading: Container(
          padding: EdgeInsets.all(kNormalPadding),
          decoration: BoxDecoration(
            color: backgroundIconColor ?? theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(kNormalRadius),
          ),
          child: icon,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: titleIsBold == true ? FontWeight.bold : null,
            color: titleColor,
          ),
          textDirection: titleDirection,
        ),
        subtitle:
            subTitle == null
                ? null
                : Text(subTitle!, style: const TextStyle(color: Colors.grey)),
        trailing: trailing,
        onLongPress: onLongPress,
        onTap: onTap,
      ),
    );
  }
}
