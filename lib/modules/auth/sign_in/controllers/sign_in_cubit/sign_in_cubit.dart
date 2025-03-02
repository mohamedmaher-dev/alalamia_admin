import 'package:alalamia_admin/core/local_storage/models/user_credential_model.dart';
import 'package:alalamia_admin/core/models/country_model.dart';
import 'package:alalamia_admin/core/networking/api_error_model.dart';
import 'package:alalamia_admin/core/networking/dio_factory.dart';
import 'package:alalamia_admin/modules/auth/rebos/auth_rebo.dart';
import 'package:alalamia_admin/modules/auth/sign_in/models/sign_in_request_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  bool isShowPassword = false;
  CountryModel countryModel = CountryModel.defaultCountry;
  final AuthRebo _authRebo;
  SignInCubit(this._authRebo) : super(SignInState.initial(false));

  void changeShowPassword() {
    isShowPassword = !isShowPassword;
    emit(SignInState.initial(isShowPassword));
  }

  Future<void> signIn(SignInRequestModel signInRequestModel) async {
    emit(SignInState.loading());
    final signInResult = await _authRebo.signIn(signInRequestModel);
    signInResult.when(
      success: (data) {
        DioFactory.setToken(data.token);
        _authRebo.saveUserCredential(
          UserCredential(
            email: email.text,
            password: password.text,
            token: data.token,
            countryName: countryModel.name,
            countryFlagPath: countryModel.imagePath,
          ),
        );
        emit(SignInState.success());
      },
      failure: (e) {
        emit(SignInState.failure(e: e));
      },
    );
  }
}
