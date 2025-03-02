import 'package:alalamia_admin/modules/notification/rebos/notification_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_fcm_state.dart';
part 'send_fcm_cubit.freezed.dart';

class FcmCubit extends Cubit<FcmState> {
  final NotificationRebo notificationRebo = NotificationRebo();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FcmCubit() : super(FcmState.initial());
  Future<void> sendFcm(String token) async {
    if (formKey.currentState!.validate()) {
      emit(FcmState.loading());
      final result = await notificationRebo.sendFcm(
        token: token,
        title: titleController.text,
        body: bodyController.text,
      );
      result.when(
        success: (success) => emit(FcmState.success()),
        failure: (failure) => emit(FcmState.failure(failure)),
      );
    }
  }
}
