part of '../settings_view.dart';

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
        ListTile(
          leading: const Icon(Icons.settings),
          title: Text(language.general, style: theme.textTheme.titleLarge),
        ),
        Card(
          child: Column(
            children: [
              CustomListTile(
                icon: const Icon(Icons.dark_mode),
                backgroundIconColor: theme.colorScheme.surface,
                title: language.night_mode,
                trailing: BlocBuilder<SettingsCubit, SettingsState>(
                  builder:
                      (final context, final state) => Switch(
                        value: appConfig.state.isDarkMode,
                        onChanged: (final value) => settingsCubit.changeTheme(),
                      ),
                ),
                backgroundColor: Colors.transparent,
              ),
              const Divider(),
              CustomListTile(
                icon: const Icon(CupertinoIcons.bell_fill),
                backgroundIconColor: theme.colorScheme.surface,
                title: language.notifications,
                trailing: BlocBuilder<SettingsCubit, SettingsState>(
                  builder:
                      (final context, final state) => Switch(
                        value: appConfig.state.turnOnNotification,
                        onChanged:
                            (final value) => settingsCubit
                                .changeEnableNotifications(newValue: value),
                      ),
                ),
                backgroundColor: Colors.transparent,
              ),
              const Divider(),
              CustomListTile(
                icon: const Icon(Icons.language),
                backgroundIconColor: theme.colorScheme.surface,
                title: language.current_language,
                trailing: TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      theme.scaffoldBackgroundColor,
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kNormalRadius),
                      ),
                    ),
                  ),
                  onPressed: settingsCubit.changeLanguage,
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
