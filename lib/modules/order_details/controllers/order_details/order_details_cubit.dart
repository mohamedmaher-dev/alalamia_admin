import 'package:alalamia_admin/core/networking/api_error_model.dart';
import 'package:alalamia_admin/modules/order_details/data/models/orders_details_response_model/orders_details_response_model.dart';
import 'package:alalamia_admin/modules/order_details/data/rebos/order_details_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_details_state.dart';
part 'order_details_cubit.freezed.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  final OrderDetailsRebo orderDetailsRebo;
  OrderDetailsCubit(this.orderDetailsRebo) : super(OrderDetailsState.loading());

  Future<void> start(String orderId) async {
    final result = await orderDetailsRebo.getOrderDetails(orderId);
    result.when(
      success: (data) {
        emit(OrderDetailsState.success(orderDetails: data));
      },
      failure: (ApiErrorModel error) {
        emit(OrderDetailsState.failure(error: error));
      },
    );
  }
}
