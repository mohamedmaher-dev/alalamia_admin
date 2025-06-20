part of 'order_status_cubit.dart';

/// State management for order status change operations
/// Represents different states during the process of updating an order's status
@freezed
class OrderStatusState with _$OrderStatusState {
  /// Initial state when the order status change screen is loaded
  const factory OrderStatusState.initial() = _Initial;

  /// State when user tries to change status to the same current status
  /// Indicates no actual change is needed
  const factory OrderStatusState.cantChange() = _CantChange;

  /// Loading state during API call to update order status
  const factory OrderStatusState.loading() = _Loading;

  /// Success state when order status has been updated successfully
  const factory OrderStatusState.success() = _Success;

  /// Failure state when order status update fails
  const factory OrderStatusState.failure() = _Failure;
}
