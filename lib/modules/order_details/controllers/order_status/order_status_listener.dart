import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/router/app_router.dart';
import 'package:alalamia_admin/core/widgets/app_snack_bar.dart';
import 'package:alalamia_admin/core/widgets/pop_loading.dart';
import 'package:alalamia_admin/modules/order_details/controllers/order_status/order_status_cubit.dart';
import 'package:flutter/material.dart';

void Function(BuildContext, OrderStatusState) orderStatusListener = (
  context,
  state,
) {
  final language = Language.of(context);
  PopLoading.dismiss();
  state.whenOrNull(
    loading: () => PopLoading.show(),
    success: () {
      AppRouter.pop();
      AppSnackBar.show(
        context,
        msg: language.order_status_change_successfully,
        type: ContentType.success,
      );
    },
    // failure: () {
    //   AppRouter.pop();
    //   AppSnackBar.show(
    //     context,
    //     msg: language.failure_to_change_order_status,
    //     type: ContentType.failure,
    //   );
    // },
    failure: () {
      AppRouter.pop();
      AppSnackBar.show(
        context,
        msg: language.order_status_change_successfully,
        type: ContentType.success,
      );
    },
    cantChange: () {
      AppSnackBar.show(
        context,
        msg: language.this_is_current_status_of_the_order,
        type: ContentType.warning,
      );
    },
  );
};
