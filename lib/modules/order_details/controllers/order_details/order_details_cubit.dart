import 'package:alalamia_admin/core/errors/app_error.dart';
import 'package:alalamia_admin/modules/order_details/data/models/orders_details_response_model/orders_details_response_model.dart';
import 'package:alalamia_admin/modules/order_details/data/repos/order_details_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_details_state.dart';
part 'order_details_cubit.freezed.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  final OrderDetailsRepo orderDetailsRepo;
  OrderDetailsCubit(this.orderDetailsRepo)
    : super(const OrderDetailsState.loading());

  Future<void> start(final String orderId) async {
    final result = await orderDetailsRepo.getOrderDetails(orderId);
    result.when(
      success: (final data) {
        emit(OrderDetailsState.success(orderDetails: data));
      },
      failure: (final error) {
        emit(OrderDetailsState.failure(error: error));
      },
    );
  }
}
