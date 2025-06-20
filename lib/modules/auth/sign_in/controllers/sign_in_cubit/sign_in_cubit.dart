import 'package:alalamia_admin/core/errors/app_error.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/repos/auth_repo.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/models/sign_in_request_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

/// Cubit for managing user authentication and sign in functionality
/// Handles form validation, password visibility, and authentication API calls
class SignInCubit extends Cubit<SignInState> {
  /// Form key for validating the sign in form
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Text controller for email input field
  final email = TextEditingController();

  /// Text controller for password input field
  final password = TextEditingController();

  /// Flag to track password visibility state
  bool isShowPassword = false;

  /// Authentication repository for handling sign in API calls
  final AuthRepo _authRepo;

  /// Initialize the cubit with authentication repository dependency
  /// Sets initial state with password hidden by default
  SignInCubit(this._authRepo)
    : super(const SignInState.initial(isShowPassword: false));

  /// Toggle password visibility between hidden and visible states
  /// Updates the UI to show/hide password characters
  void changeShowPassword() {
    isShowPassword = !isShowPassword;
    emit(SignInState.initial(isShowPassword: isShowPassword));
  }

  /// Perform user authentication with provided credentials
  /// [signInRequestModel] - Contains email and password for authentication
  /// Emits loading state during API call, then success or failure based on result
  Future<void> signIn(final SignInRequestModel signInRequestModel) async {
    // Show loading state while making API call
    emit(const SignInState.loading());

    // Call authentication repository to sign in user
    final signInResult = await _authRepo.signIn(signInRequestModel);

    // Handle the result using pattern matching
    signInResult.when(
      // On successful authentication, emit success state
      success: (final data) {
        emit(const SignInState.success());
      },
      // On authentication failure, emit failure state with error
      failure: (final e) {
        emit(SignInState.failure(e: e));
      },
    );
  }
}
