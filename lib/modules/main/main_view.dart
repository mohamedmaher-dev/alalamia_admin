import 'package:alalamia_admin/core/di/di.dart';
import 'package:alalamia_admin/core/local_storage/local_storage_service.dart';
import 'package:alalamia_admin/core/local_storage/models/user_credential_model.dart';
import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/models/country_model.dart';
import 'package:alalamia_admin/core/router/app_router.gr.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:alalamia_admin/core/widgets/app_info_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

// Import custom widget components for app bar and bottom navigation
part 'widgets/main_app_bar.dart';
part 'widgets/main_bottom_nav_bar.dart';

/// Main navigation container for the Alalamia Admin application
/// Provides bottom tab navigation between Statistics, Orders, and Settings
/// Serves as the primary entry point after successful authentication
@RoutePage()
class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(final BuildContext context) => PopScope(
    // Prevent back navigation from main view (user should use proper logout)
    canPop: false,
    child: AutoTabsScaffold(
      // Start with Orders tab (index 1) as the primary focus
      homeIndex: 1,
      // Custom app bar with dynamic content based on current tab
      appBarBuilder:
          (_, final tabsRouter) => _MainAppBar(tabsRouter: tabsRouter),
      // Define the three main navigation routes
      routes: const [StatisticsRoute(), OrdersRoute(), SettingsRoute()],
      // Custom bottom navigation bar with tab switching logic
      bottomNavigationBuilder:
          (_, final tabsRouter) => _HomeBottomNavBar(tabsRouter: tabsRouter),
    ),
  );
}
