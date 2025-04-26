import 'package:alalamia_admin/core/di/di.dart';
import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/router/app_router.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:alalamia_admin/core/utils/assets_manger.dart';
import 'package:alalamia_admin/core/utils/validation.dart';
import 'package:alalamia_admin/core/widgets/app_snack_bar.dart';
import 'package:alalamia_admin/core/widgets/change_language_btn.dart';
import 'package:alalamia_admin/core/widgets/icon_btn_change_theme.dart';
import 'package:alalamia_admin/core/widgets/pop_loading.dart';
import 'package:alalamia_admin/modules/auth/sign_in/controllers/sign_in_cubit/sign_in_cubit.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/models/sign_in_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'widgets/form_body.dart';
part 'widgets/welcome_body.dart';
part 'widgets/sign_in_btn.dart';
part 'widgets/sign_in_listener.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(final BuildContext context) => BlocProvider(
    create: (final context) => di<SignInCubit>(),
    child: const _SignIn(),
  );
}

class _SignIn extends StatelessWidget {
  const _SignIn();

  @override
  @override
  Widget build(final BuildContext context) {
    final Language language = Language.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: const [ChangeLanguageBtn(), Spacer(), IconBtnChangeTheme()],
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            const _WelcomeBody(),
            SizedBox(height: kSpacingBetweenWidgetsHight),
            Card(
              child: Padding(
                padding: EdgeInsets.all(kNormalPadding),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: kSpacingBetweenWidgetsHight,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(language.sign_in, style: TextStyles.tsP15B),
                        subtitle: Text(
                          language.please_input_your_email_and_password,
                        ),
                      ),
                      const _FormBody(),
                      const _SignInBtn(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
