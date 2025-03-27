import 'package:alalamia_admin/core/cubit/main_cubit.dart';
import 'package:alalamia_admin/core/local_storage/local_storage_service.dart';
import 'package:alalamia_admin/core/router/app_router.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/widgets/pop_confirm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/localization/generated/l10n.dart';
import '../../../core/themes/app_theme_controller.dart';
part 'widgets/settings_general_body_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SettingsBody();
  }
}

class _SettingsBody extends StatefulWidget {
  const _SettingsBody();

  @override
  State<_SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<_SettingsBody> {
  @override
  Widget build(BuildContext context) {
    final mainBloc = BlocProvider.of<MainCubit>(context);
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: ListView(
            padding: EdgeInsets.all(10.w),
            children: [_SettingsGeneralBodyView(mainBloc: mainBloc)],
          ),
        );
      },
    );
  }
}
