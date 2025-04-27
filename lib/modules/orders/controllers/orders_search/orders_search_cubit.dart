import 'package:alalamia_admin/core/extension/order_payment_type.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_search_state.dart';
part 'orders_search_cubit.freezed.dart';

class OrdersSearchCubit extends Cubit<OrdersSearchState> {
  final TextEditingController searchController = TextEditingController();

  OrdersSearchCubit() : super(const OrdersSearchState.disabled());
  void setSearch(String search, final List<OrdersDatum> orders) {
    search = search.trim().toLowerCase();
    if (search.isEmpty) {
      if (!isClosed) emit(const OrdersSearchState.disabled());
    } else {
      final result =
          orders.where((final element) {
            if (element.userName.trim().toLowerCase().contains(search) ||
                element.phone.trim().toLowerCase().contains(search) ||
                element.requestNumber.trim().toLowerCase().contains(search) ||
                element.paymentType.paymentTypeText
                    .trim()
                    .toLowerCase()
                    .contains(search)) {
              return true;
            } else {
              return false;
            }
          }).toList();

      if (result.isEmpty) {
        if (!isClosed) emit(const OrdersSearchState.empty());
      } else {
        if (!isClosed) emit(OrdersSearchState.enabled(orders: result));
      }
    }
  }

  void clearSearch() {
    searchController.clear();
    if (!isClosed) emit(const OrdersSearchState.disabled());
  }
}
