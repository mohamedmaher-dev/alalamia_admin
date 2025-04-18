import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/di/di.dart';
import 'package:alalamia_admin/core/local_storage/local_storage_service.dart';
import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/modules/home/controllers/home_nav/home_nav_cubit.dart';
import 'package:alalamia_admin/modules/home/views/home_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
part 'home_app_bar.dart';
part 'homw_bottom_nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeNavCubit(),
      child: const _HomeViewBody(),
    );
  }
}

class _HomeViewBody extends StatelessWidget {
  const _HomeViewBody();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeNavCubit>();
    return BlocBuilder<HomeNavCubit, HomeNavState>(
      builder: (context, state) {
        return PopScope(
          onPopInvokedWithResult:
              (didPop, result) => cubit.changePage(HomePages.defaultPage),
          canPop: false,
          child: Scaffold(
            appBar: _HomeAppBar(currentPage: state.page),
            body: PageView(
              controller: cubit.controller,
              physics: NeverScrollableScrollPhysics(),
              children: HomePages.values.map((e) => e.view).toList(),
            ),
            bottomNavigationBar: _HomeBottomNavBar(
              currentIndex: state.page.currentIndex,
            ),
          ),
        );
      },
    );
  }
}
