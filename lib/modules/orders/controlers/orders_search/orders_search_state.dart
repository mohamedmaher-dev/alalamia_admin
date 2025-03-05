part of 'orders_search_cubit.dart';

@freezed
class OrdersSearchState with _$OrdersSearchState {
  const factory OrdersSearchState.disabled() = DisabledMode;
  const factory OrdersSearchState.enabled({required List<OrderItem> orders}) =
      EnabledMode;
  const factory OrdersSearchState.empty() = EmptyMode;
}
