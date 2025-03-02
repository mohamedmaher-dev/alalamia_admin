import 'package:alalamia_admin/modules/auth/services/api_auth_consts.dart';
import 'package:alalamia_admin/modules/auth/sign_in/models/sign_in_request_model.dart';
import 'package:alalamia_admin/modules/auth/sign_in/models/sign_in_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_auth_service.g.dart';

@RestApi()
abstract class ApiAuthService {
  factory ApiAuthService(Dio dio, {required String baseUrl}) = _ApiAuthService;
  @POST(ApiAuthConsts.signIn)
  Future<SignInResponseModel> signIn(
    @Body() SignInRequestModel signInRequestModel,
  );
}
