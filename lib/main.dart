import 'package:alalamia_admin/alalamia_admin.dart';
import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/config/bloc_observer.dart';
import 'package:alalamia_admin/core/di/di.dart';
import 'package:alalamia_admin/core/local_storage/local_storage_service.dart';
import 'package:alalamia_admin/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await diInit();
  await di<LocalStorageService>().init();
  Bloc.observer = MyBlocObserver();
  runApp(
    BlocProvider(
      create: (context) => di<AppConfig>(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: const AlalamiaAdmin(),
      ),
    ),
  );
}
