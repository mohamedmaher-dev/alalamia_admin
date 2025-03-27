part of 'order_status_cubit.dart';

@freezed
class OrderStatusState with _$OrderStatusState {
  const factory OrderStatusState.initial() = _Initial;
  const factory OrderStatusState.cantChange() = _CantChange;
  const factory OrderStatusState.loading() = _Loading;
  const factory OrderStatusState.success() = _Success;
  const factory OrderStatusState.failure() = _Failure;
}
