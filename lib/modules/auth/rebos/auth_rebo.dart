import 'package:alalamia_admin/core/local_storage/local_storage_service.dart';
import 'package:alalamia_admin/core/local_storage/models/user_credential_model.dart';
import 'package:alalamia_admin/core/networking/api_result.dart';
import 'package:alalamia_admin/core/networking/api_try_catch.dart';
import 'package:alalamia_admin/modules/auth/services/api_auth_service.dart';
import 'package:alalamia_admin/modules/auth/sign_in/models/sign_in_request_model.dart';
import 'package:alalamia_admin/modules/auth/sign_in/models/sign_in_response_model.dart';

class AuthRebo {
  final ApiAuthService apiAuthService;
  final LocalStorageService localStorageService;
  AuthRebo({required this.apiAuthService, required this.localStorageService});

  Future<ApiResult<SignInResponseModel>> signIn(
    SignInRequestModel signInRequestModel,
  ) => apiTryCatch(apiCall: apiAuthService.signIn(signInRequestModel));

  Future<void> saveUserCredential(UserCredential userCredential) async {
    await localStorageService.saveUserCredential(
      userCredential: userCredential,
    );
  }

  Future<UserCredential?> getUserCredential() async =>
      LocalStorageService.userCredential;
}
