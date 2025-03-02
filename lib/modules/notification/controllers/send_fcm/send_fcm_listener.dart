import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/router/app_router.dart';
import 'package:alalamia_admin/core/widgets/app_snack_bar.dart';
import 'package:alalamia_admin/core/widgets/pop_loading.dart';
import 'package:alalamia_admin/modules/notification/controllers/send_fcm/send_fcm_cubit.dart';
import 'package:flutter/material.dart';

void Function(BuildContext, FcmState) fcmListener = (context, state) {
  final language = Language.of(context);
  PopLoading.dismiss();
  state.whenOrNull(
    failure: (e) {
      AppSnackBar.show(
        context,
        msg: language.failure_to_send_notification,
        type: ContentType.failure,
      );
    },
    loading: () {
      AppRouter.pop();
      PopLoading.show();
    },
    success: () {
      AppSnackBar.show(
        context,
        msg: language.notification_sent_successfully,
        type: ContentType.success,
      );
    },
  );
};
