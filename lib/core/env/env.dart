// ignore_for_file: avoid_classes_with_only_static_members

import 'package:envied/envied.dart';

part 'env.g.dart';

/// Environment configuration class for managing app-wide environment variables
/// Uses Envied package for secure environment variable management with obfuscation
/// Provides access to sensitive configuration data like API URLs and keys
@Envied(useConstantCase: true, obfuscate: true)
abstract class Env {
  /// Base URL for the backend API server
  /// Automatically obfuscated in production builds for security
  /// Retrieved from .env file or environment variables during build
  @EnviedField()
  static String apiBaseUrl = _Env.apiBaseUrl;
}
