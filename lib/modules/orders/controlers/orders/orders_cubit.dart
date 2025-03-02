import 'package:alalamia_admin/core/networking/api_error_model.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders/orders_response_model.dart';
import 'package:alalamia_admin/modules/orders/data/rebos/orders_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_state.dart';
part 'orders_cubit.freezed.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final TextEditingController searchController = TextEditingController();
  late OrdersResponseModel ordersResponseModel;
  final OrdersRebo ordersRebo;
  OrdersCubit(this.ordersRebo) : super(OrdersState.loading());

  Future<void> getOrders(int page) async {
    emit(OrdersState.loading());
    final result = await ordersRebo.getOrders();
    result.when(
      success: (data) {
        if (data.trackingRequests.orderItems.isEmpty) {
          emit(OrdersState.empty());
        } else {
          ordersResponseModel = data;
          emit(OrdersState.success(list: data.trackingRequests.orderItems));
        }
      },
      failure: (error) {
        emit(OrdersState.failure(e: error));
      },
    );
  }

  search(String text) {
    text = text.trim().toLowerCase();
    if (text.isEmpty) {
      emit(
        OrdersState.success(
          list: ordersResponseModel.trackingRequests.orderItems,
        ),
      );
    } else {
      final result =
          ordersResponseModel.trackingRequests.orderItems.where((element) {
            if (element.cart.user.name.trim().toLowerCase().contains(text) ||
                element.cart.user.phone.trim().toLowerCase().contains(text) ||
                element.requestNumber.trim().toLowerCase().contains(text)) {
              return true;
            } else {
              return false;
            }
          }).toList();

      if (result.isEmpty) {
        emit(OrdersState.empty());
      } else {
        emit(OrdersState.success(list: result));
      }
    }
  }
}
