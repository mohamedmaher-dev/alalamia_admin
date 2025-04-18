part of "../settings_view.dart";

class _SettingsGeneralBodyView extends StatelessWidget {
  const _SettingsGeneralBodyView();

  @override
  Widget build(BuildContext context) {
    final AppConfig appConfig = context.read<AppConfig>();
    final language = Language.of(context);
    return Column(
      children: [
        ListTile(title: Text(language.general, style: TextStyles.ts15B)),
        Card(
          child: Column(
            children: [
              ListTile(
                title: Text(language.night_mode),
                leading: const Icon(Icons.dark_mode),
                trailing: Switch(
                  value: appConfig.state.isDarkMode,
                  onChanged: (value) async {
                    appConfig.changeTheme();
                  },
                ),
              ),
              const Divider(),
              ListTile(
                title: Text(language.notifications),
                leading: const Icon(CupertinoIcons.bell_fill),
                trailing: Switch(
                  value: appConfig.state.turnOnNotification,
                  onChanged: (value) async {
                    appConfig.changeTurnOnNotification(value);
                  },
                ),
              ),
              const Divider(),
              ListTile(
                title: Text(language.current_language),
                leading: const Icon(Icons.language),
                trailing: ElevatedButton(
                  style: const ButtonStyle(
                    elevation: WidgetStatePropertyAll(0),
                  ),
                  onPressed: () {
                    appConfig.changeLanguage();
                  },
                  child: Text(language.language_name),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
