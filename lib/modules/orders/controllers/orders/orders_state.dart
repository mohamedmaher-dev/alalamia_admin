part of 'orders_cubit.dart';

/// State management for orders list functionality
/// Currently uses a simple initial state as pagination is handled by PagingController
@freezed
class OrdersState with _$OrdersState {
  /// Initial state when the orders screen is first loaded
  /// Pagination logic is managed separately by infinite scroll controller
  const factory OrdersState.initial() = _Initial;
}
