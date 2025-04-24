import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeLanguageBtn extends StatelessWidget {
  const ChangeLanguageBtn({super.key});

  @override
  Widget build(final BuildContext context) {
    final appConfig = context.read<AppConfig>();
    final language = Language.of(context);
    return TextButton(
      onPressed: appConfig.changeLanguage,
      child: BlocBuilder<AppConfig, AppConfigModel>(
        builder: (final context, final config) => Text(language.language_name),
      ),
    );
  }
}
