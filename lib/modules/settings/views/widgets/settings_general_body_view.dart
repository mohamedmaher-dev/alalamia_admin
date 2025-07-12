part of '../settings_view.dart';

/// General settings section widget containing app-wide preferences
/// Provides controls for theme mode, notifications, and language selection
/// Integrates with settings cubit for state management and persistence
class _SettingsGeneralBodyView extends StatelessWidget {
  const _SettingsGeneralBodyView();

  @override
  Widget build(final BuildContext context) {
    final settingsCubit = context.read<SettingsCubit>();
    final AppConfig appConfig = context.read<AppConfig>();
    final language = Language.of(context);
    final theme = Theme.of(context);

    return Column(
      children: [
        // Section header with settings icon and title
        ListTile(
          leading: const Icon(Icons.settings),
          title: Text(language.general, style: theme.textTheme.titleLarge),
        ),
        // Settings options card container
        Card(
          child: Column(
            children: [
              // Dark/Light theme mode toggle
              CustomListTile(
                icon: const Icon(Icons.dark_mode),
                backgroundIconColor: theme.colorScheme.surface,
                title: language.night_mode,
                trailing: BlocBuilder<SettingsCubit, SettingsState>(
                  builder: (final context, final state) => Switch(
                    // Show current theme mode state
                    value: appConfig.state.isDarkMode,
                    // Toggle theme when switch is changed
                    onChanged: (final value) => settingsCubit.changeTheme(),
                  ),
                ),
                backgroundColor: Colors.transparent,
              ),
              const Divider(height: 0),
              // Push notifications enable/disable toggle
              CustomListTile(
                icon: const Icon(CupertinoIcons.bell_fill),
                backgroundIconColor: theme.colorScheme.surface,
                title: language.notifications,
                trailing: BlocBuilder<SettingsCubit, SettingsState>(
                  builder: (final context, final state) => Switch(
                    // Show current notification permission state
                    value: appConfig.state.turnOnNotification,
                    // Update notification settings when switch is changed
                    onChanged: (final value) => settingsCubit
                        .changeEnableNotifications(newValue: value),
                  ),
                ),
                backgroundColor: Colors.transparent,
              ),
              const Divider(height: 0),
              // Language selection control
              CustomListTile(
                icon: const Icon(Icons.language),
                backgroundIconColor: theme.colorScheme.surface,
                title: language.current_language,
                trailing: TextButton(
                  style: ButtonStyle(
                    // Button background matching scaffold color
                    backgroundColor: WidgetStatePropertyAll(
                      theme.scaffoldBackgroundColor,
                    ),
                    // Rounded corners matching app design
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kNormalRadius),
                      ),
                    ),
                  ),
                  // Toggle language when pressed
                  onPressed: settingsCubit.changeLanguage,
                  // Display current language name
                  child: Text(language.language_name),
                ),
                backgroundColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
