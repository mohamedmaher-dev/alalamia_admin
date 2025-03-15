import 'package:alalamia_admin/core/extension/order_payment_type.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_search_state.dart';
part 'orders_search_cubit.freezed.dart';

class OrdersSearchCubit extends Cubit<OrdersSearchState> {
  final TextEditingController searchController = TextEditingController();

  OrdersSearchCubit() : super(OrdersSearchState.disabled());
  setSearch(String search, List<OrdersDatum> orders) {
    search = search.trim().toLowerCase();
    if (search.isEmpty) {
      emit(OrdersSearchState.disabled());
    } else {
      final result =
          orders.where((element) {
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
        emit(OrdersSearchState.empty());
      } else {
        emit(OrdersSearchState.enabled(orders: result));
      }
    }
  }

  void clearSearch() {
    searchController.clear();
    emit(OrdersSearchState.disabled());
  }
}
