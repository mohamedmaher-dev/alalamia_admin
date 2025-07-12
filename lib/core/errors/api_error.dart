// ignore_for_file: avoid_catches_without_on_clauses, avoid_dynamic_calls

part of 'app_error.dart';

/// API error class for handling HTTP and network-related errors
/// Converts Dio exceptions and HTTP responses into user-friendly error messages
/// Provides localized error messages based on different error types and status codes
class ApiError extends AppError {
  /// Private constructor for creating API error instances
  /// [msg] - Error message to display to the user
  /// [code] - HTTP status code or error code (defaults to 0)
  ApiError._({required super.msg, super.code = 0});

  /// Factory constructor for creating unknown/generic API errors
  /// Returns a generic unknown error with localized message
  /// Used when the specific error type cannot be determined
  factory ApiError.fromUnknown() =>
      ApiError._(msg: Language.current.unknown_error);

  /// Factory constructor for creating API errors from Dio exceptions
  /// Converts various Dio exception types into user-friendly error messages
  /// [dioException] - The Dio exception to convert into an API error
  /// Returns appropriate error message based on the exception type
  factory ApiError.fromDioException({
    required final DioException dioException,
  }) {
    final language = Language.current;
    switch (dioException.type) {
      // Connection timeout - server took too long to respond
      case DioExceptionType.connectionTimeout:
        return ApiError._(msg: language.connection_timeout);

      // Send timeout - client took too long to send the request
      case DioExceptionType.sendTimeout:
        return ApiError._(msg: language.send_timeout);

      // Receive timeout - server response took too long
      case DioExceptionType.receiveTimeout:
        return ApiError._(msg: language.receive_timeout);

      // Bad certificate - SSL/TLS certificate issues
      case DioExceptionType.badCertificate:
        return ApiError._(msg: language.bad_certificate);

      // Bad response - server returned an error status code
      case DioExceptionType.badResponse:
        return _fromBadResponse(dioException: dioException);

      // Request was cancelled
      case DioExceptionType.cancel:
        return ApiError._(msg: language.connection_canceled);

      // Connection error - network connectivity issues
      case DioExceptionType.connectionError:
        return ApiError._(msg: language.connection_error);

      // Unknown error type
      case DioExceptionType.unknown:
        return ApiError.fromUnknown();
    }
  }

  /// Private static method for handling bad HTTP response errors
  /// Parses error messages from different HTTP status codes and response formats
  /// [dioException] - The Dio exception containing the bad response
  /// Returns specific error message based on status code and response structure
  static ApiError _fromBadResponse({required final DioException dioException}) {
    final int code = dioException.response!.statusCode ?? 0;
    final Response? response = dioException.response;

    switch (code) {
      // Bad Request (400) - client error with validation messages
      case 400:
        try {
          // Try to extract password validation error first
          return ApiError._(
            msg: response!.data['error']['password'][0],
            code: code,
          );
        } catch (e) {
          try {
            // Fallback to general message field
            return ApiError._(msg: response!.data['message'], code: code);
          } catch (e) {
            // If all parsing fails, return unknown error
            return ApiError.fromUnknown();
          }
        }

      // Unauthorized (401) - authentication/authorization error
      case 401:
        return ApiError._(msg: response!.data['error'], code: code);

      // All other status codes default to unknown error
      default:
        return ApiError.fromUnknown();
    }
  }
}
