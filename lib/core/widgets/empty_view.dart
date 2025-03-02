import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(icon, size: 50.w, color: Colors.grey),
        Text(
          text,
          style: TextStyle(fontSize: 10.sp, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
