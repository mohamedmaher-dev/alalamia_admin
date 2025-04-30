import 'package:alalamia_admin/core/errors/app_error.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/repos/auth_repo.dart';
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
  final AuthRepo _authRepo;
  SignInCubit(this._authRepo)
    : super(const SignInState.initial(isShowPassword: false));

  void changeShowPassword() {
    isShowPassword = !isShowPassword;
    emit(SignInState.initial(isShowPassword: isShowPassword));
  }

  Future<void> signIn(final SignInRequestModel signInRequestModel) async {
    emit(const SignInState.loading());
    final signInResult = await _authRepo.signIn(signInRequestModel);
    signInResult.when(
      success: (final data) {
        emit(const SignInState.success());
      },
      failure: (final e) {
        emit(SignInState.failure(e: e));
      },
    );
  }
}
