import 'package:alalamia_admin/core/local_storage/local_storage_service.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// Factory class for creating and configuring Dio HTTP client instances
/// Implements singleton pattern to ensure single HTTP client throughout the app
/// Handles authentication, timeouts, and logging configuration
class DioFactory {
  // Private constructor to prevent instantiation
  DioFactory._();

  /// Singleton Dio instance for HTTP operations
  static Dio? _dio;

  /// Get configured Dio instance with authentication and interceptors
  /// [localStorageService] - Service to access stored user credentials
  /// Returns configured Dio client ready for API calls
  static Dio getDio(final LocalStorageService localStorageService) {
    // Get user credentials for authentication token
    final userCredential = localStorageService.userCredential;

    if (_dio == null) {
      // Configure timeout settings for all HTTP operations
      const Duration timout = Duration(seconds: 30);

      // Create new Dio instance
      _dio = Dio();

      // Configure Dio with timeouts and authentication
      _dio!
        // Set connection timeout
        ..options.connectTimeout = timout
        // Set request send timeout
        ..options.sendTimeout = timout
        // Set response receive timeout
        ..options.receiveTimeout = timout
        // Set authorization header with bearer token if user is authenticated
        ..options.headers['Authorization'] =
            userCredential == null ? '' : 'Bearer ${userCredential.token}'
        // Commented authentication interceptor for automatic logout on 401
        // Uncomment to enable automatic redirect to splash on auth failure
        // ..interceptors.add(
        //   InterceptorsWrapper(
        //     onError: (final error, final handler) async {
        //       if (error.response?.statusCode == 401 &&
        //           AppRouter.currentPage != AppPages.signIn) {
        //         AppRouter.pushReplacement(AppPages.splash);
        //       }
        //       return handler.next(error);
        //     },
        //   ),
        // )
        // Add pretty logger for debugging HTTP requests and responses
        ..interceptors.add(
          PrettyDioLogger(requestBody: true, requestHeader: true),
        );
      return _dio!;
    } else {
      // Return existing instance if already configured
      return _dio!;
    }
  }

  /// Update the authorization token for existing Dio instance
  /// [token] - New authentication token to set
  /// Used after successful login or token refresh
  static void setToken(final String token) {
    _dio!.options.headers['Authorization'] = 'Bearer $token';
  }
}
