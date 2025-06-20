import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/di/di.dart';
import 'package:alalamia_admin/core/local_storage/local_storage_service.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:alalamia_admin/core/widgets/app_snack_bar.dart';
import 'package:alalamia_admin/core/widgets/custom_list_tile.dart';
import 'package:alalamia_admin/core/widgets/pop_confirm.dart';
import 'package:alalamia_admin/core/widgets/pop_loading.dart';
import 'package:alalamia_admin/modules/settings/views/controllers/settings/settings_cubit.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/localization/generated/l10n.dart';

// Import widget parts for modular settings UI components
part 'widgets/settings_general_body_view.dart';
part 'widgets/settings_profile_body.dart';
part 'widgets/settings_listener.dart';

/// Main settings screen for app configuration and user preferences
/// Provides controls for theme, language, notifications, and user account management
/// Part of the main bottom navigation tab structure
@RoutePage()
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(final BuildContext context) => BlocProvider(
    // Provide SettingsCubit for managing all settings operations
    create: (final context) => di<SettingsCubit>(),
    child: const _SettingsBody(),
  );
}

/// Private body widget containing the settings screen structure
/// Manages state listening and provides scrollable layout for settings sections
class _SettingsBody extends StatefulWidget {
  const _SettingsBody();

  @override
  State<_SettingsBody> createState() => _SettingsBodyState();
}

/// State class for settings body with listener integration
/// Handles settings operation feedback through BlocListener
class _SettingsBodyState extends State<_SettingsBody> {
  @override
  Widget build(final BuildContext context) =>
      BlocListener<SettingsCubit, SettingsState>(
        // Listen to settings state changes for user feedback
        listener: _listener,
        child: const Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // General app settings section (theme, language, notifications)
                _SettingsGeneralBodyView(),
                // User profile and account management section
                _SettingsProfileBody(),
              ],
            ),
          ),
        ),
      );
}
