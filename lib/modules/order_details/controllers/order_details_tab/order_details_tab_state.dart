part of 'order_details_tab_cubit.dart';

/// State management for order details tab navigation
/// Tracks which tab is currently active within the order details screen
@freezed
class OrderDetailsTabState with _$OrderDetailsTabState {
  /// State indicating a tab change has occurred
  /// [tab] - The currently active tab in the order details screen
  const factory OrderDetailsTabState.change({
    required final OrderDetailsTabsModel tab,
  }) = _Change;
}
