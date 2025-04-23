part of "../settings_view.dart";

class _SettingsGeneralBodyView extends StatelessWidget {
  const _SettingsGeneralBodyView();

  @override
  Widget build(BuildContext context) {
    final settingsCubit = context.read<SettingsCubit>();
    final AppConfig appConfig = context.read<AppConfig>();
    final language = Language.of(context);
    final theme = Theme.of(context);

    return Column(
      children: [
        ListTile(title: Text(language.general, style: TextStyles.ts15B)),
        Card(
          child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return Column(
                children: [
                  ListTile(
                    title: Text(language.night_mode),
                    leading: const Icon(Icons.dark_mode),
                    trailing: Switch(
                      value: appConfig.state.isDarkMode,
                      onChanged: (value) => settingsCubit.changeTheme(),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(language.notifications),
                    leading: const Icon(CupertinoIcons.bell_fill),
                    trailing: Switch(
                      value: appConfig.state.turnOnNotification,
                      onChanged:
                          (value) =>
                              settingsCubit.changeEnableNotifications(value),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(language.current_language),
                    leading: const Icon(Icons.language),
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
                      onPressed: () => settingsCubit.changeLanguage(),
                      child: Text(language.language_name),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
