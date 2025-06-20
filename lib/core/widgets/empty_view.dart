import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Empty state widget for displaying when lists or content are empty
/// Shows a centered icon and descriptive text in grey color
/// Used throughout the app to indicate no data or empty collections
class EmptyView extends StatelessWidget {
  const EmptyView({super.key, required this.icon, required this.text});

  /// Icon to display representing the empty state
  final IconData icon;

  /// Descriptive text explaining the empty state to users
  final String text;

  @override
  Widget build(final BuildContext context) => Column(
    // Center content vertically and stretch horizontally
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      // Large grey icon for visual representation
      Icon(icon, size: 50.w, color: Colors.grey),
      // Descriptive text in grey color with center alignment
      Text(
        text,
        style: TextStyle(fontSize: 10.sp, color: Colors.grey),
        textAlign: TextAlign.center,
      ),
    ],
  );
}
