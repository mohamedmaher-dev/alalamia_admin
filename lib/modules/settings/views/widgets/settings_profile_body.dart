part of '../settings_view.dart';

/// User profile section widget containing account information and logout functionality
/// Displays current user details and provides secure logout with confirmation dialog
/// Integrates with local storage for user credentials and settings cubit for logout
class _SettingsProfileBody extends StatelessWidget {
  const _SettingsProfileBody();

  @override
  Widget build(final BuildContext context) {
    // Get current user credentials from local storage
    final userCredential = di<LocalStorageService>().userCredential!;
    final settingsCubit = context.read<SettingsCubit>();
    final language = Language.of(context);
    final theme = Theme.of(context);
    return Column(
      children: [
        // Section header with profile icon and title
        ListTile(
          leading: const Icon(CupertinoIcons.profile_circled),
          title: Text(language.my_profile, style: theme.textTheme.titleLarge),
        ),
        // Profile information and actions card
        Card(
          child: Column(
            children: [
              // User profile information display with logout option
              CustomListTile(
                icon: const Icon(CupertinoIcons.person_fill),
                backgroundIconColor: theme.colorScheme.surface,
                title: language.my_profile,
                // Show user's email address as subtitle
                subTitle: userCredential.email,
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
                  // Show logout confirmation dialog when pressed
                  onPressed: () async {
                    showChangerPopUpConfirm(
                      context: context,
                      title: language.log_out,
                      subtitle: language.are_you_sure_you_want_to_log_out,
                      // Execute logout when user confirms
                      onPressed: () => settingsCubit.signOut(context),
                    );
                  },
                  child: Text(language.log_out),
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
