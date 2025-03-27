part of 'order_details_tab_cubit.dart';

@freezed
class OrderDetailsTabState with _$OrderDetailsTabState {
  const factory OrderDetailsTabState.change({
    required OrderDetailsTabsModel tab,
  }) = _Change;
}
