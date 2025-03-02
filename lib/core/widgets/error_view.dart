import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(size: 25.w, CupertinoIcons.xmark_circle, color: Colors.red),
        SizedBox(height: 5.h),
        Text(
          'Something went wrong, please try again',
          style: TextStyles.tsP10N,
          textAlign: TextAlign.center,
        ),
        if (onPressed != null)
          TextButton.icon(
            style: const ButtonStyle(elevation: WidgetStatePropertyAll(0)),
            onPressed: onPressed,
            label: const Text('Try Again'),
            icon: const Icon(Icons.refresh),
          ),
      ],
    );
  }
}
