import 'package:alalamia_admin/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

/// Service for initializing Firebase and configuring crash reporting
/// Handles Firebase Core initialization and Crashlytics error tracking
/// Sets up automatic error reporting for production builds
class FirebaseService {
  // Private constructor to prevent instantiation
  FirebaseService._();

  /// Initialize Firebase services and configure error reporting
  /// Must be called during app startup before using any Firebase features
  /// Sets up Crashlytics for automatic crash and error reporting in release mode
  static Future<void> init() async {
    // Initialize Firebase Core with platform-specific configuration
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Set up automatic error reporting only in release builds
    if (kReleaseMode) {
      // Capture Flutter framework errors (widget build errors, etc.)
      FlutterError.onError = (final errorDetails) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      };

      // Capture platform-level errors (native crashes, async exceptions)
      PlatformDispatcher.instance.onError = (final error, final stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true; // Mark error as handled
      };
    }
  }
}
