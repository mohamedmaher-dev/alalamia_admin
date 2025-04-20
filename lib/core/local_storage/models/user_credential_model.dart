import 'package:alalamia_admin/core/local_storage/hive_adapter_type.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/models/sign_in_request_model.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/models/sign_in_response_model.dart';
import 'package:hive/hive.dart';
part 'user_credential_model.g.dart';

@HiveType(typeId: HiveAdapterType.userCredential)
class UserCredential {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String password;
  @HiveField(2)
  final String token;
  @HiveField(3)
  final String countryName;
  @HiveField(4)
  final int countryId;
  @HiveField(5)
  final String? countryCode;
  UserCredential({
    required this.email,
    required this.password,
    required this.token,
    required this.countryName,
    required this.countryId,
    this.countryCode,
  });

  factory UserCredential.fromAuth(
    SignInResponseModel data,
    SignInRequestModel requestData,
  ) {
    return UserCredential(
      email: requestData.email,
      password: requestData.password,
      token: data.token,
      countryName: data.countryModel.name,
      countryId: data.countryModel.id,
    );
  }
}
