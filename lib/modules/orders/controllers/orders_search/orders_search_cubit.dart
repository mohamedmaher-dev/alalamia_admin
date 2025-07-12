import 'package:alalamia_admin/core/extension/order_payment_type.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_search_state.dart';
part 'orders_search_cubit.freezed.dart';

/// Cubit for managing orders search functionality
/// Handles local filtering of orders based on search criteria
/// Searches through user name, phone, request number, and payment type
class OrdersSearchCubit extends Cubit<OrdersSearchState> {
  /// Text controller for the search input field
  final TextEditingController searchController = TextEditingController();

  /// Initialize cubit with disabled search state
  OrdersSearchCubit() : super(const OrdersSearchState.disabled());

  /// Perform search filtering on the provided orders list
  /// [search] - The search query string entered by user
  /// [orders] - Complete list of orders to search through
  ///
  /// Searches in multiple fields:
  /// - User name
  /// - Phone number
  /// - Request/Order number
  /// - Payment type
  void setSearch(String search, final List<OrdersDatum> orders) {
    // Clean and normalize search string
    search = search.trim().toLowerCase();

    // If search is empty, disable search mode
    if (search.isEmpty) {
      if (!isClosed) emit(const OrdersSearchState.disabled());
    } else {
      // Filter orders based on search criteria
      final result =
          orders.where((final element) {
            // Check if search matches any of the searchable fields
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

      // Emit appropriate state based on search results
      if (result.isEmpty) {
        // No orders found matching search criteria
        if (!isClosed) emit(const OrdersSearchState.empty());
      } else {
        // Orders found, emit enabled state with filtered results
        if (!isClosed) emit(OrdersSearchState.enabled(orders: result));
      }
    }
  }

  /// Clear the search input and disable search mode
  /// Resets to showing all orders without filtering
  void clearSearch() {
    searchController.clear();
    if (!isClosed) emit(const OrdersSearchState.disabled());
  }
}
