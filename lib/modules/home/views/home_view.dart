import 'package:alalamia_admin/core/local_storage/local_storage_service.dart';
import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/router/app_router.dart';
import 'package:alalamia_admin/modules/orders/views/orders_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final language = Language.of(context);
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        actions: [
          IconButton(
            onPressed: () {
              AppRouter.pushAndRemoveUntil(AppPages.settings);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
        title: ListTile(
          leading: Image.asset(
            LocalStorageService.userCredential!.countryFlagPath,
          ),
          title: Text(language.home_page),
          subtitle: Text(LocalStorageService.userCredential!.email),
        ),
      ),
      body: OrdersView(),
    );
  }
}
