import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/extension/bool_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IconBtnChangeTheme extends StatelessWidget {
  const IconBtnChangeTheme({super.key});

  @override
  Widget build(final BuildContext context) {
    final appConfig = context.read<AppConfig>();
    return BlocBuilder<AppConfig, AppConfigModel>(
      builder:
          (final context, final config) => IconButton(
            onPressed: appConfig.changeTheme,
            icon: Icon(config.isDarkMode.boolToIcon),
          ),
    );
  }
}
