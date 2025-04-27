import 'package:alalamia_admin/alalamia_admin.dart';
import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/config/bloc_observer.dart';
import 'package:alalamia_admin/core/di/di.dart';
import 'package:alalamia_admin/core/firebase/firabase_service.dart';
import 'package:alalamia_admin/core/local_storage/local_storage_service.dart';
import 'package:alalamia_admin/core/notifications/notifications_service.dart';
import 'package:alalamia_admin/core/utils/app_info_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  // Ensure that plugin services are initialized before running the app.
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the app info service to fetch application metadata.
  await AppInfoService.init();
  // Set the preferred orientation of the app to portrait mode only.
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // Initialize Firebase with the default options for the current platform.
  await FirebaseService.init();
  // Initialize dependency injection for the app.
  await DependencyInjection.init();
  // Initialize the local storage service.
  await di<LocalStorageService>()();
  // Initialize the notifications service.
  await di<NotificationsService>()();
  // Initialize bloc observer for the app.
  Bloc.observer = MyBlocObserver();
  // Initialize the app configuration and run the app.
  runApp(
    BlocProvider(
      create: (final context) => di<AppConfig>(),
      child: const ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        child: AlalamiaAdmin(),
      ),
    ),
  );
}
