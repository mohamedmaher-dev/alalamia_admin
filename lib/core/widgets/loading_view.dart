import 'package:flutter/material.dart';

/// Simple loading indicator widget for displaying loading states
/// Shows a centered circular progress indicator with reduced stroke width
/// Used throughout the app to indicate data fetching or processing states
class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(final BuildContext context) =>
  // Center the loading indicator and use thinner stroke for cleaner appearance
  const Center(child: CircularProgressIndicator(strokeWidth: 2));
}
