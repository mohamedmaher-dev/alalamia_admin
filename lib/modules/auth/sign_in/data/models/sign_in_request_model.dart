import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_request_model.g.dart';

@JsonSerializable(createFactory: false)
class SignInRequestModel {
  final String email;
  final String password;
  SignInRequestModel({required this.email, required this.password});
  Map<String, dynamic> toJson() => _$SignInRequestModelToJson(this);
}
