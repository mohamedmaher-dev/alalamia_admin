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

/// Main entry point for the Alalamia Admin application
/// Initializes all required services, configures app settings, and launches the app
/// Follows a specific initialization sequence to ensure proper app startup
void main() async {
  // STEP 1: Core Flutter Framework Initialization
  // Ensure that plugin services are initialized before running the app
  // This is crucial for accessing platform-specific features and services
  WidgetsFlutterBinding.ensureInitialized();

  // STEP 2: App Metadata Initialization
  // Initialize the app info service to fetch application metadata
  // Retrieves app version, build number, and other package information
  await AppInfoService.init();

  // STEP 3: Device Orientation Configuration
  // Set the preferred orientation of the app to portrait mode only
  // Ensures consistent UI experience across all admin operations
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // STEP 4: Firebase Services Initialization
  // Initialize Firebase with the default options for the current platform
  // Sets up Firebase Core, Crashlytics, and other Firebase services
  await FirebaseService.init();

  // STEP 5: Dependency Injection Setup
  // Initialize dependency injection container for the app
  // Registers all services, repositories, and cubits for app-wide access
  await DependencyInjection.init();

  // STEP 6: Local Storage Initialization
  // Initialize the local storage service (Hive database)
  // Sets up encrypted local storage for user credentials and app data
  await di<LocalStorageService>()();

  // STEP 7: Push Notifications Setup
  // Initialize the notifications service for Firebase Cloud Messaging
  // Sets up FCM tokens, topic subscriptions, and notification handling
  await di<NotificationsService>()();

  // STEP 8: State Management Monitoring
  // Initialize bloc observer for debugging and monitoring state changes
  // Provides comprehensive logging for all BLoC/Cubit state transitions
  Bloc.observer = MyBlocObserver();

  // STEP 9: App Launch
  // Initialize the app configuration and run the main application
  // Wraps the app with necessary providers and responsive design utilities
  runApp(
    // Provide app configuration cubit to the entire widget tree
    BlocProvider(
      create: (final context) => di<AppConfig>(),
      child: const ScreenUtilInit(
        // Enable minimum text adaptation for better accessibility
        minTextAdapt: true,
        // Support split screen mode for tablets and foldable devices
        splitScreenMode: true,
        // Launch the main Alalamia Admin application
        child: AlalamiaAdmin(),
      ),
    ),
  );
}
