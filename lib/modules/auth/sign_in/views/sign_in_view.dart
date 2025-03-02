import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/router/app_router.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:alalamia_admin/core/utils/assets_manger.dart';
import 'package:alalamia_admin/core/utils/validation.dart';
import 'package:alalamia_admin/core/widgets/app_snack_bar.dart';
import 'package:alalamia_admin/core/widgets/change_country_btn.dart';
import 'package:alalamia_admin/core/widgets/change_language_btn.dart';
import 'package:alalamia_admin/core/widgets/pop_loading.dart';
import 'package:alalamia_admin/modules/auth/sign_in/controllers/sign_in_cubit/sign_in_cubit.dart';
import 'package:alalamia_admin/modules/auth/sign_in/models/sign_in_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'widgets/form_body.dart';
part 'widgets/welcome_body.dart';
part 'widgets/sign_in_btn.dart';
part 'widgets/sign_in_listener.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInCubit>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF00102B),
        appBar: AppBar(
          forceMaterialTransparency: true,
          actions: [ChangeLanguageBtn()],
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
  }
}
