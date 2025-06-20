import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/extension/bool_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Theme toggle button widget for switching between light and dark modes
/// Displays appropriate icon based on current theme state and toggles theme when pressed
/// Integrates with app configuration to persist theme preference
class IconBtnChangeTheme extends StatelessWidget {
  const IconBtnChangeTheme({super.key});

  @override
  Widget build(final BuildContext context) {
    final appConfig = context.read<AppConfig>();
    return BlocBuilder<AppConfig, AppConfigModel>(
      builder:
          (final context, final config) => IconButton(
            // Toggle theme when button is pressed
            onPressed: appConfig.changeTheme,
            // Show sun/moon icon based on current theme mode
            // Uses bool extension to convert dark mode state to appropriate icon
            icon: Icon(config.isDarkMode.boolToIcon),
          ),
    );
  }
}
