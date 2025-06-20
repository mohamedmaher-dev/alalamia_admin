import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/data/data_result.dart';
import 'package:alalamia_admin/core/errors/app_error.dart';
import 'package:alalamia_admin/core/local_storage/local_storage_service.dart';
import 'package:alalamia_admin/core/local_storage/models/user_credential_model.dart';
import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/networking/api_service.dart';
import 'package:alalamia_admin/core/networking/dio_factory.dart';
import 'package:alalamia_admin/core/notifications/notifications_service.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/models/sign_in_request_model.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/models/sign_in_response_model.dart';
import 'package:dio/dio.dart';

/// Repository for handling user authentication operations
/// Manages sign in, sign out, token refresh, and credential persistence
/// Integrates with API service, local storage, and notification service
class AuthRepo {
  /// Service for managing push notifications
  final NotificationsService notificationsService;

  /// API service for authentication network requests
  final ApiService apiAuthService;

  /// Service for local data persistence and caching
  final LocalStorageService localStorageService;

  /// App configuration for notification preferences
  final AppConfig appConfig;

  /// Initialize repository with required service dependencies
  AuthRepo({
    required this.apiAuthService,
    required this.localStorageService,
    required this.notificationsService,
    required this.appConfig,
  });

  /// Authenticate user with email and password
  /// [signInRequestModel] - Contains user credentials for authentication
  /// Returns DataResult with sign in response or error
  Future<DataResult<SignInResponseModel>> signIn(
    final SignInRequestModel signInRequestModel,
  ) async {
    try {
      // Perform the sign in operation
      final data = await _signInMethod(signInRequestModel);
      // Enable notifications after successful sign in
      await notificationsService.changeEnableNotifications(isTurnOn: true);
      // Return successful result
      return DataResult.success(data: data);
    } on DioException catch (e) {
      // Handle network/API errors
      return DataResult.failure(
        error: ApiError.fromDioException(dioException: e),
      );
    } on Exception catch (_) {
      // Handle unexpected errors
      return DataResult.failure(error: UnknownError());
    }
  }

  /// Internal method to perform sign in API call and save credentials
  /// [signInRequestModel] - User credentials for authentication
  /// Returns sign in response with user data and token
  Future<SignInResponseModel> _signInMethod(
    final SignInRequestModel signInRequestModel,
  ) async {
    // Call authentication API
    final data = await apiAuthService.signIn(signInRequestModel);
    // Configure HTTP client with received token
    DioFactory.setToken(data.token);
    // Save user credentials to local storage for auto-login
    saveUserCredential(UserCredential.fromAuth(data, signInRequestModel));
    return data;
  }

  /// Refresh user token using saved credentials for automatic login
  /// Used during app startup to maintain user session
  /// Returns DataResult with refreshed token or error
  Future<DataResult<SignInResponseModel>> refreshToken() async {
    try {
      // Get saved user credentials from local storage
      final userCredential = localStorageService.userCredential;
      final signInRequestModel = SignInRequestModel.fromUserCredential(
        userCredential!,
      );
      // Perform sign in with saved credentials
      final data = await _signInMethod(signInRequestModel);
      // Update notification settings based on user preference
      await notificationsService.changeEnableNotifications(
        isTurnOn: appConfig.state.turnOnNotification,
      );
      return DataResult.success(data: data);
    } on DioException catch (e) {
      // Handle network/API errors during token refresh
      return DataResult.failure(
        error: ApiError.fromDioException(dioException: e),
      );
    } on Exception catch (_) {
      // Handle unexpected errors during token refresh
      return DataResult.failure(error: UnknownError());
    }
  }

  /// Sign out the current user and clear session data
  /// Removes saved credentials and disables notifications
  /// Returns DataResult indicating success or failure
  Future<DataResult<void>> signOut() async {
    final language = Language.current;
    try {
      // Remove saved user credentials from local storage
      await localStorageService.deleteUserCredential();
      // Disable push notifications on sign out
      await notificationsService.changeEnableNotifications(isTurnOn: false);
      return const DataResult.success(data: null);
    } on Exception catch (_) {
      // Handle errors during sign out process
      return DataResult.failure(
        error: CacheError(msg: language.failed_to_sign_out),
      );
    }
  }

  /// Save user credentials to local storage for automatic login
  /// [userCredential] - User credential data to persist
  Future<void> saveUserCredential(final UserCredential userCredential) async {
    await localStorageService.saveUserCredential(
      userCredential: userCredential,
    );
  }

  /// Retrieve saved user credentials from local storage
  /// Returns user credentials if available, null otherwise
  Future<UserCredential?> getUserCredential() async =>
      localStorageService.userCredential;
}
