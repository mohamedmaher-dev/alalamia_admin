import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/di/di.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:alalamia_admin/core/widgets/app_snack_bar.dart';
import 'package:alalamia_admin/core/widgets/pop_confirm.dart';
import 'package:alalamia_admin/core/widgets/pop_loading.dart';
import 'package:alalamia_admin/modules/settings/views/controllers/settings/settings_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/localization/generated/l10n.dart';
part 'widgets/settings_general_body_view.dart';
part 'widgets/settings_profile_body.dart';
part 'widgets/settings_listener.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => di<SettingsCubit>(),
    child: const _SettingsBody(),
  );
}

class _SettingsBody extends StatefulWidget {
  const _SettingsBody();

  @override
  State<_SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<_SettingsBody> {
  @override
  Widget build(BuildContext context) =>
      BlocListener<SettingsCubit, SettingsState>(
        listener: _listener,
        child: const Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [_SettingsGeneralBodyView(), _SettingsProfileBody()],
            ),
          ),
        ),
      );
}
