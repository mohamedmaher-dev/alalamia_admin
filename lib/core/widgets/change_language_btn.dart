import 'package:alalamia_admin/core/cubit/main_cubit.dart';
import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeLanguageBtn extends StatelessWidget {
  const ChangeLanguageBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainCubit>();
    final language = Language.of(context);
    return TextButton(
      onPressed: () {
        mainCubit.changeLanguage();
      },
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return Text(language.language_name);
        },
      ),
    );
  }
}
