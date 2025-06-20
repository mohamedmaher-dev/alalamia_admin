import 'package:alalamia_admin/core/extension/int_ext.dart';
import 'package:alalamia_admin/modules/order_details/data/repos/order_details_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_status_state.dart';
part 'order_status_cubit.freezed.dart';

/// Cubit for managing order status change operations
/// Handles updating order status through API calls and manages loading states
/// Validates status changes and prevents unnecessary updates
class OrderStatusCubit extends Cubit<OrderStatusState> {
  /// Repository for order details and status update operations
  final OrderDetailsRepo orderDetailsRepo;

  /// Initialize the cubit with order details repository dependency
  OrderStatusCubit(this.orderDetailsRepo)
    : super(const OrderStatusState.initial());

  /// Change the status of an order to a new status
  /// [newIndex] - Index representing the new order status
  /// [currentIndex] - Index representing the current order status
  /// [orderId] - Unique identifier of the order to update
  /// Validates that the new status is different from current before making API call
  Future<void> changeStatus(
    final int newIndex,
    final int currentIndex,
    final String orderId,
  ) async {
    // Check if the new status is actually different from current status
    if (newIndex != currentIndex) {
      // Show loading state during API call
      emit(const OrderStatusState.loading());

      // Call repository to update order status
      // Convert index to enum using extension method
      final result = await orderDetailsRepo.changeOrderStatus(
        orderId,
        newIndex.indexToEnum,
      );

      // Handle the API response
      result.when(
        // On successful status update
        success: (final data) {
          emit(const OrderStatusState.success());
        },
        // On failed status update
        failure: (final error) {
          emit(const OrderStatusState.failure());
        },
      );
    } else {
      // Emit cantChange state when trying to set same status
      emit(const OrderStatusState.cantChange());
    }
  }
}
