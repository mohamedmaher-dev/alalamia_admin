part of 'order_details_cubit.dart';

/// State management for order details screen
/// Represents different states while fetching and displaying order information
@freezed
class OrderDetailsState with _$OrderDetailsState {
  /// Loading state while fetching order details from API
  const factory OrderDetailsState.loading() = _Loading;

  /// Success state when order details are loaded successfully
  /// [orderDetails] - Complete order information including customer, items, status
  const factory OrderDetailsState.success({
    required final OrdersDetailsResponseModel orderDetails,
  }) = _Success;

  /// Failure state when order details fetching fails
  /// [error] - The error that occurred during the fetch operation
  const factory OrderDetailsState.failure({required final AppError error}) =
      _Failure;
}
