import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAvatarBody extends StatelessWidget {
  const UserAvatarBody({super.key, required this.userName});
  final String userName;

  @override
  Widget build(final BuildContext context) => Initicon(
    size: 35.r,
    text: userName.substring(0, 1).toUpperCase(),
    backgroundColor: ColorManger.myGold,
    borderRadius: BorderRadius.circular(kNormalRadius),
    style: const TextStyle(
      fontFamily: AppThemeData.fontFamily,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
}
