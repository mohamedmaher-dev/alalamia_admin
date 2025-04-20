part of '../settings_view.dart';

class _SettingsProfileBody extends StatelessWidget {
  const _SettingsProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsCubit = context.read<SettingsCubit>();
    final language = Language.of(context);
    return Column(
      children: [
        ListTile(title: Text(language.my_profile, style: TextStyles.ts15B)),
        Card(
          child: Column(
            children: [
              ListTile(
                title: Text(language.my_profile),
                leading: const Icon(CupertinoIcons.person),
                trailing: ElevatedButton(
                  style: const ButtonStyle(
                    elevation: WidgetStatePropertyAll(0),
                  ),
                  onPressed: () async {
                    showChangerPopUpConfirm(
                      context: context,
                      title: language.log_out,
                      subtitle: language.are_you_sure_you_want_to_log_out,
                      onPressed: () => settingsCubit.signOut(),
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
