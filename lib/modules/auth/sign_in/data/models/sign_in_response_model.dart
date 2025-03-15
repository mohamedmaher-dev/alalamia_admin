import 'package:json_annotation/json_annotation.dart';
part 'sign_in_response_model.g.dart';

@JsonSerializable(createToJson: false)
class SignInResponseModel {
  @JsonKey(name: 'access_token')
  final String token;

  SignInResponseModel({required this.token});
  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseModelFromJson(json);
}
