part of 'order_details_cubit.dart';

@freezed
class OrderDetailsState with _$OrderDetailsState {
  const factory OrderDetailsState.loading() = _Loading;
  const factory OrderDetailsState.success({
    required final OrdersDetailsResponseModel orderDetails,
  }) = _Success;
  const factory OrderDetailsState.failure({required final AppError error}) =
      _Failure;
}
