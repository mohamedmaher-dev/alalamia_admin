import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:dio/dio.dart';

// Import specific error type implementations
part '../errors/api_error.dart';
part '../errors/cache_error.dart';
part '../errors/unknown_error.dart';

/// Base sealed class for all application errors
/// Provides a common interface for different types of errors that can occur
/// Uses sealed class pattern to ensure exhaustive handling of all error types
sealed class AppError {
  /// Human-readable error message for display to users
  final String msg;

  /// Numeric error code for programmatic error identification
  final int code;

  /// Base constructor for all error types
  /// [msg] - User-friendly error message
  /// [code] - Unique error code for identification
  AppError({required this.msg, required this.code});
}
