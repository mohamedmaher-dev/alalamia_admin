part of '../sign_in_view.dart';

class _WelcomeBody extends StatelessWidget {
  const _WelcomeBody();

  @override
  Widget build(BuildContext context) {
    final language = Language.of(context);
    return BlocBuilder<AppConfig, AppConfigModel>(
      builder: (context, state) {
        return Column(
          children: [
            ListTile(
              title: Text(
                language.welcome_back,
                style: TextStyles.tsP30B,
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                language.please_input_your_data_to_sign_in,
                style: TextStyles.ts10N,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: kSpacingBetweenWidgetsHight),
            Hero(
              tag: 'logo',
              child: Image.asset(
                AssetsManger.iconIcon,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                fit: BoxFit.contain,
              ),
            ),
          ],
        );
      },
    );
  }
}
