import 'package:alalamia_admin/core/models/country_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'sign_in_response_model.g.dart';

@JsonSerializable(createToJson: false)
class SignInResponseModel {
  @JsonKey(name: 'access_token')
  final String token;
  @JsonKey(name: 'country_id')
  final CountryModel countryModel;

  SignInResponseModel({required this.token, required this.countryModel});
  factory SignInResponseModel.fromJson(final Map<String, dynamic> json) =>
      _$SignInResponseModelFromJson(json);
}
