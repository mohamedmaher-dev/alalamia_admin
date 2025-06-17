part of 'app_error.dart';

/// Cache error class for handling local storage and caching failures
/// Used when operations involving local database, shared preferences, or cache fail
/// Provides specific error handling for data persistence and retrieval issues
class CacheError extends AppError {
  /// Creates a cache error instance with custom error message
  /// [msg] - Descriptive error message explaining the cache operation failure
  /// Uses default error code 0 for cache-related errors
  CacheError({required super.msg}) : super(code: 0);
}
