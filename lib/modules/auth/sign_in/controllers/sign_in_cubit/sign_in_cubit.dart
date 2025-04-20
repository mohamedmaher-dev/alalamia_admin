import 'package:alalamia_admin/core/errors/error_interface.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/rebos/auth_rebo.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/models/sign_in_request_model.dart';
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
        emit(SignInState.success());
      },
      error: (e) {
        emit(SignInState.failure(e: e));
      },
    );
  }
}
