import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class PopLoading {
  PopLoading._();
  static init() => EasyLoading.init();
  static show() {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: false,
      indicator: const CircularProgressIndicator(
        strokeWidth: 2,
        color: ColorManger.myGold,
      ),
    );
  }

  static dismiss() => EasyLoading.dismiss();
}
