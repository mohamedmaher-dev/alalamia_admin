import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class AppSnackBar {
  AppSnackBar._();

  static show(
    BuildContext context, {
    required String msg,
    required ContentType type,
  }) {
    final language = Language();
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 5),
      padding: EdgeInsets.all(25.w),
      content: AwesomeSnackbarContent(
        title:
            type == ContentType.failure
                ? language.failure
                : type == ContentType.success
                ? language.success
                : language.warning,
        message: msg,
        contentType: type,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
