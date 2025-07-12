part of 'orders_search_cubit.dart';

/// State management for orders search functionality
/// Represents different states of the search feature (disabled, enabled with results, empty)
@freezed
class OrdersSearchState with _$OrdersSearchState {
  /// Disabled state when search is not active or search query is empty
  /// Shows normal orders list without filtering
  const factory OrdersSearchState.disabled() = DisabledMode;

  /// Enabled state when search is active and has results
  /// [orders] - Filtered list of orders matching the search criteria
  const factory OrdersSearchState.enabled({
    required final List<OrdersDatum> orders,
  }) = EnabledMode;

  /// Empty state when search is active but no orders match the criteria
  /// Shows empty/no results message to user
  const factory OrdersSearchState.empty() = EmptyMode;
}
