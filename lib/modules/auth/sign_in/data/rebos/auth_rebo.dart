import 'package:alalamia_admin/core/config/app_config_cubit.dart';
import 'package:alalamia_admin/core/data/data_result.dart';
import 'package:alalamia_admin/core/errors/error_interface.dart';
import 'package:alalamia_admin/core/local_storage/local_storage_service.dart';
import 'package:alalamia_admin/core/local_storage/models/user_credential_model.dart';
import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/networking/api_service.dart';
import 'package:alalamia_admin/core/networking/dio_factory.dart';
import 'package:alalamia_admin/core/notifications/notifications_service.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/models/sign_in_request_model.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/models/sign_in_response_model.dart';
import 'package:dio/dio.dart';

class AuthRebo {
  final NotificationsService notificationsService;
  final ApiService apiAuthService;
  final LocalStorageService localStorageService;
  final AppConfig appConfig;
  AuthRebo({
    required this.apiAuthService,
    required this.localStorageService,
    required this.notificationsService,
    required this.appConfig,
  });

  Future<DataResult<SignInResponseModel>> signIn(
    SignInRequestModel signInRequestModel,
  ) async {
    try {
      // Call the API to sign in
      final data = await _signInMethod(signInRequestModel);
      // Change enable notifications
      await notificationsService.changeEnableNotifications(true);
      // Return the result
      return DataResult.success(data);
    } on DioException catch (e) {
      return DataResult.error(ApiError.fromDioException(dioException: e));
    } catch (e) {
      return DataResult.error(UnknownError());
    }
  }

  Future<SignInResponseModel> _signInMethod(
    SignInRequestModel signInRequestModel,
  ) async {
    final data = await apiAuthService.signIn(signInRequestModel);
    // Set the token in DioFactory
    DioFactory.setToken(data.token);
    // Save user credentials in local storage
    saveUserCredential(UserCredential.fromAuth(data, signInRequestModel));
    return data;
  }

  Future<DataResult<SignInResponseModel>> refreshToken(
    SignInRequestModel signInRequestModel,
  ) async {
    try {
      // Call the API to sign in
      final data = await _signInMethod(signInRequestModel);
      // Change enable notifications
      await notificationsService.changeEnableNotifications(
        appConfig.state.turnOnNotification,
      );
      return DataResult.success(data);
    } on DioException catch (e) {
      return DataResult.error(ApiError.fromDioException(dioException: e));
    } catch (e) {
      return DataResult.error(UnknownError());
    }
  }

  Future<DataResult<void>> signOut() async {
    final language = Language.current;
    try {
      await localStorageService.deleteUserCredential();
      await notificationsService.changeEnableNotifications(false);
      return DataResult.success(null);
    } catch (e) {
      return DataResult.error(CacheError(msg: language.failed_to_sign_out));
    }
  }

  Future<void> saveUserCredential(UserCredential userCredential) async {
    await localStorageService.saveUserCredential(
      userCredential: userCredential,
    );
  }

  Future<UserCredential?> getUserCredential() async =>
      localStorageService.userCredential;
}
