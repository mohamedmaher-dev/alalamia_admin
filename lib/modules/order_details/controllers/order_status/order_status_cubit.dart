import 'package:alalamia_admin/core/extension/int_ext.dart';
import 'package:alalamia_admin/modules/order_details/data/rebos/order_details_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_status_state.dart';
part 'order_status_cubit.freezed.dart';

class OrderStatusCubit extends Cubit<OrderStatusState> {
  final OrderDetailsRebo orderDetailsRebo;
  OrderStatusCubit(this.orderDetailsRebo)
    : super(const OrderStatusState.initial());

  Future<void> changeStatus(
    int newIndex,
    int currentIndex,
    String orderId,
  ) async {
    if (newIndex != currentIndex) {
      emit(const OrderStatusState.loading());
      final result = await orderDetailsRebo.changeOrderStatus(
        orderId,
        newIndex.indexToEnum,
      );
      result.when(
        success: (data) {
          emit(const OrderStatusState.success());
        },
        failure: (error) {
          emit(const OrderStatusState.failure());
        },
      );
    } else {
      emit(const OrderStatusState.cantChange());
    }
  }
}
