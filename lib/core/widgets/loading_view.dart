import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(final BuildContext context) =>
      const Center(child: CircularProgressIndicator(strokeWidth: 2));
}
