import 'dart:io';

import 'package:alalamia_admin/core/extension/string_ext.dart';
import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/utils/app_info_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Widget displaying comprehensive application information and metadata
/// Shows app details like version, build number, install times, and platform info
/// Useful for debugging, support, and app information screens
class AppInfoView extends StatelessWidget {
  const AppInfoView({super.key});

  @override
  Widget build(final BuildContext context) {
    final language = Language.of(context);
    return Directionality(
      // Force LTR direction for technical information display
      textDirection: TextDirection.ltr,
      child: ListView(
        shrinkWrap: true,
        children: [
          const Divider(),
          // App name with platform-specific icon
          ListTile(
            leading: Icon(Platform.isAndroid ? Icons.android : Icons.apple),
            title: Text(AppInfoService.appName),
            subtitle: const Text('App name'),
          ),
          // Package/Bundle identifier
          ListTile(
            leading: const Icon(CupertinoIcons.cube_box),
            title: Text(AppInfoService.packageName),
            subtitle: const Text('Package name'),
          ),
          // Version and build number in a row layout
          Row(
            children: [
              // App version number
              Expanded(
                child: ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: Text(AppInfoService.version),
                  subtitle: const Text('Version'),
                ),
              ),
              // Build number
              Expanded(
                child: ListTile(
                  leading: const Icon(Icons.build),
                  title: Text(AppInfoService.buildNumber),
                  subtitle: const Text('Build number'),
                ),
              ),
            ],
          ),
          // App store where the app was installed from
          ListTile(
            leading: const Icon(Icons.store),
            title: Text(AppInfoService.installerStore.nullToString),
            subtitle: const Text('Installer store'),
          ),
          // Original installation timestamp
          ListTile(
            leading: const Icon(Icons.install_mobile_rounded),
            title: Text(
              AppInfoService.installTime == null
                  ? language.no_data
                  : AppInfoService.installTime.toString(),
            ),
            subtitle: const Text('Install time'),
          ),
          // Last update timestamp
          ListTile(
            leading: const Icon(Icons.update_rounded),
            title: Text(
              AppInfoService.updateTime == null
                  ? language.no_data
                  : AppInfoService.updateTime.toString(),
            ),
            subtitle: const Text('Update time'),
          ),
        ],
      ),
    );
  }
}
