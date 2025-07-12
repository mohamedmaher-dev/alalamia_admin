part of 'app_error.dart';

/// Unknown error class for handling unexpected exceptions and edge cases
/// Used when an error occurs that doesn't fit into specific error categories
/// Provides generic error handling with localized error messages
class UnknownError extends AppError {
  /// Creates an unknown error instance with localized error message
  /// Uses default error code 0 to indicate general/unknown error type
  /// Automatically retrieves localized error text from current language settings
  UnknownError() : super(msg: Language.current.unknown_error, code: 0);
}
