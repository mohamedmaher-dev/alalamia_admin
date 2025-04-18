import 'package:alalamia_admin/core/local_storage/local_storage_service.dart';
import 'package:alalamia_admin/core/local_storage/models/user_credential_model.dart';
import 'package:alalamia_admin/core/networking/api_error_model.dart';
import 'package:alalamia_admin/core/networking/api_result.dart';
import 'package:alalamia_admin/core/networking/api_service.dart';
import 'package:alalamia_admin/core/networking/dio_factory.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/models/sign_in_request_model.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/models/sign_in_response_model.dart';
import 'package:dio/dio.dart';

class AuthRebo {
  final ApiService apiAuthService;
  final LocalStorageService localStorageService;
  AuthRebo({required this.apiAuthService, required this.localStorageService});

  Future<ApiResult<SignInResponseModel>> signIn(
    SignInRequestModel signInRequestModel,
  ) async {
    try {
      final data = await apiAuthService.signIn(signInRequestModel);
      DioFactory.setToken(data.token);
      saveUserCredential(UserCredential.fromAuth(data, signInRequestModel));
      return ApiResult.success(data);
    } on DioException catch (e) {
      return ApiResult.failure(ApiErrorModel.fromDioException(dioException: e));
    } catch (e) {
      return ApiResult.failure(ApiErrorModel.fromUnknown(e: e));
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
