import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class AppSnackBar {
  AppSnackBar._();

  static late BuildContext _context;
  static void init(final BuildContext context) =>
      AppSnackBar._context = context;

  static void show({
    required final String msg,
    required final ContentType type,
    final String? title,
  }) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 5),
      padding: EdgeInsets.all(25.w),
      content: AwesomeSnackbarContent(
        title: _getTitle(type, title),
        message: msg,
        contentType: type,
      ),
    );

    ScaffoldMessenger.of(_context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static String _getTitle(final ContentType type, final String? title) {
    final language = Language();
    if (title != null) {
      return title;
    } else {
      return switch (type) {
        ContentType.success => language.success,
        ContentType.warning => language.warning,
        ContentType.failure => language.failure,
        ContentType.help => language.notification,
        ContentType() => throw UnimplementedError(),
      };
    }
  }
}
