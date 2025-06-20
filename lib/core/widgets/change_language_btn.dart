import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Language toggle button widget for switching between Arabic and English
/// Displays the current language name and toggles to the opposite language when pressed
/// Integrates with app configuration to persist language preference
class ChangeLanguageBtn extends StatelessWidget {
  const ChangeLanguageBtn({super.key});

  @override
  Widget build(final BuildContext context) {
    final appConfig = context.read<AppConfig>();
    final language = Language.of(context);
    return TextButton(
      // Toggle language when button is pressed
      onPressed: appConfig.changeLanguage,
      child: BlocBuilder<AppConfig, AppConfigModel>(
        builder:
            (final context, final config) =>
            // Display current language name (updates automatically when language changes)
            Text(language.language_name),
      ),
    );
  }
}
