part of '../sign_in_view.dart';

/// Welcome section widget for the sign in screen
/// Displays app branding, welcome message, and logo with hero animation
/// Provides visual appeal and user orientation at the top of authentication screen
class _WelcomeBody extends StatelessWidget {
  const _WelcomeBody();

  @override
  Widget build(final BuildContext context) {
    final language = Language.of(context);
    return Column(
      children: [
        // Welcome message and instructions
        ListTile(
          title: Text(
            // Main welcome text in large, bold, primary color
            language.welcome_back,
            style: TextStyles.tsP30B,
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            // Instructions for user guidance
            language.please_input_your_data_to_sign_in,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: kSpacingBetweenWidgetsHight),
        // App logo with hero animation for smooth transitions
        Hero(
          tag: 'logo',
          child: Image.asset(
            AssetsManger.iconIcon,
            // Responsive size - half the screen width
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.width / 2,
            // Maintain aspect ratio while fitting container
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
