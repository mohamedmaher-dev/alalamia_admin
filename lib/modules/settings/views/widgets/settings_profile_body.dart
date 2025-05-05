part of '../settings_view.dart';

class _SettingsProfileBody extends StatelessWidget {
  const _SettingsProfileBody();

  @override
  Widget build(final BuildContext context) {
    final userCredential = di<LocalStorageService>().userCredential!;
    final settingsCubit = context.read<SettingsCubit>();
    final language = Language.of(context);
    final theme = Theme.of(context);
    return Column(
      children: [
        ListTile(
          leading: const Icon(CupertinoIcons.profile_circled),
          title: Text(language.my_profile, style: theme.textTheme.titleLarge),
        ),
        Card(
          child: Column(
            children: [
              ListTile(
                title: Text(language.my_profile),
                subtitle: Text(userCredential.email),
                leading: const Icon(CupertinoIcons.person_fill),
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
                  onPressed: () async {
                    showChangerPopUpConfirm(
                      context: context,
                      title: language.log_out,
                      subtitle: language.are_you_sure_you_want_to_log_out,
                      onPressed: () => settingsCubit.signOut(context),
                    );
                  },
                  child: Text(language.log_out),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
