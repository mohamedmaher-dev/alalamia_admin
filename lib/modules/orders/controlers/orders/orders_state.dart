part of 'orders_cubit.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.loading() = OrdersStateLoading;
  const factory OrdersState.success({required List<OrderItem> list}) = _Success;
  const factory OrdersState.failure({required ApiErrorModel e}) = _Failure;
  const factory OrdersState.empty() = _Empty;
}
