import 'package:alalamia_admin/core/local_storage/models/user_credential_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_request_model.g.dart';

@JsonSerializable(createFactory: false)
class SignInRequestModel {
  final String email;
  final String password;
  SignInRequestModel({required this.email, required this.password});
  Map<String, dynamic> toJson() => _$SignInRequestModelToJson(this);
  factory SignInRequestModel.fromUserCredential(UserCredential userCredential) {
    return SignInRequestModel(
      email: userCredential.email,
      password: userCredential.password,
    );
  }
}
