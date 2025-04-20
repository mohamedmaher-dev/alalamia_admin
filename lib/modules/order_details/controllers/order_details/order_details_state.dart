part of 'order_details_cubit.dart';

@freezed
class OrderDetailsState with _$OrderDetailsState {
  const factory OrderDetailsState.loading() = _Loading;
  const factory OrderDetailsState.success({
    required OrdersDetailsResponseModel orderDetails,
  }) = _Success;
  const factory OrderDetailsState.failure({required ErrorInterface error}) =
      _Failure;
}
