import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/router/app_router.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:alalamia_admin/core/utils/assets_manger.dart';
import 'package:alalamia_admin/core/utils/validation.dart';
import 'package:alalamia_admin/core/widgets/app_snack_bar.dart';
import 'package:alalamia_admin/core/widgets/change_country_btn.dart';
import 'package:alalamia_admin/core/widgets/change_language_btn.dart';
import 'package:alalamia_admin/core/widgets/icon_btn_change_theme.dart';
import 'package:alalamia_admin/core/widgets/pop_loading.dart';
import 'package:alalamia_admin/modules/auth/sign_in/controllers/sign_in_cubit/sign_in_cubit.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/models/sign_in_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'widgets/form_body.dart';
part 'widgets/welcome_body.dart';
part 'widgets/sign_in_btn.dart';
part 'widgets/sign_in_listener.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    );
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInCubit>();
    return BlocBuilder<AppConfig, AppConfigModel>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              forceMaterialTransparency: true,
              actions: [ChangeLanguageBtn(), Spacer(), IconBtnChangeTheme()],
            ),
            body: Center(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(kMediumPadding),
                children: [
                  _WelcomeBody(),
                  SizedBox(height: kSpacingBetweenWidgetsHight),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(kNormalPadding),
                      child: Column(
                        spacing: kSpacingBetweenWidgetsHight,
                        children: [
                          _FormBody(),
                          ChangeCountryBtn(
                            onSelectionChanged: (value) {
                              cubit.countryModel = value;
                            },
                          ),
                          _SignInBtn(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
