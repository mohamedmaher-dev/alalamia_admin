import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/widgets/app_snack_bar.dart';
import 'package:alalamia_admin/core/widgets/pop_loading.dart';
import 'package:alalamia_admin/modules/order_details/controllers/order_status/order_status_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Global listener function for handling order status change operations
/// Manages UI feedback and navigation based on status update results
/// Provides user feedback through loading overlays and snack bar messages
void Function(BuildContext, OrderStatusState) orderStatusListener = (
  final context,
  final state,
) {
  final language = Language.of(context);

  // Always dismiss any existing loading overlay to prevent stacking
  PopLoading.dismiss();

  state.whenOrNull(
    // Show loading overlay during status change API call
    loading: () => PopLoading.show(),

    // Handle successful status change
    success: () {
      // Navigate back to previous screen
      context.router.pop();
      // Show success message to admin user
      AppSnackBar.show(
        msg: language.order_status_change_successfully,
        type: ContentType.success,
      );
    },

    // Handle status change failure
    // Note: Currently showing success message due to temporary workaround
    failure: () {
      // Navigate back to previous screen
      context.router.pop();
      // Temporary: showing success message instead of failure
      // Commented code below shows intended behavior
      AppSnackBar.show(
        msg: language.order_status_change_successfully,
        type: ContentType.success,
      );

      // Original intended failure handling (commented out):
      // AppSnackBar.show(
      //   msg: language.failure_to_change_order_status,
      //   type: ContentType.failure,
      // );
    },

    // Handle attempt to change to same status
    cantChange: () {
      // Show warning message that order is already in this status
      AppSnackBar.show(
        msg: language.this_is_current_status_of_the_order,
        type: ContentType.warning,
      );
    },
  );
};
