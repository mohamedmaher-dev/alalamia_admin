// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponseModel _$SignInResponseModelFromJson(Map<String, dynamic> json) =>
    SignInResponseModel(
      token: json['access_token'] as String,
      countryModel: $enumDecode(_$CountryModelEnumMap, json['country_id']),
    );

const _$CountryModelEnumMap = {
  CountryModel.global: '0',
  CountryModel.uae: 2,
  CountryModel.ksa: 3,
};
