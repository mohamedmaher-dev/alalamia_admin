import 'package:alalamia_admin/core/errors/app_error.dart';
import 'package:alalamia_admin/modules/order_details/data/models/orders_details_response_model/orders_details_response_model.dart';
import 'package:alalamia_admin/modules/order_details/data/repos/order_details_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_details_state.dart';
part 'order_details_cubit.freezed.dart';

/// Cubit for managing order details screen data and operations
/// Handles fetching comprehensive information for a specific order
/// Displays customer details, items, pricing, status, and order history
class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  /// Repository for order details data access operations
  final OrderDetailsRepo orderDetailsRepo;

  /// Initialize cubit with loading state (data will be fetched on start)
  OrderDetailsCubit(this.orderDetailsRepo)
    : super(const OrderDetailsState.loading());

  /// Fetch and load order details for a specific order
  /// [orderId] - Unique identifier of the order to retrieve details for
  /// Emits loading state initially, then success or failure based on result
  Future<void> start(final String orderId) async {
    // Call repository to fetch order details
    final result = await orderDetailsRepo.getOrderDetails(orderId);

    // Handle the API response and emit appropriate state
    result.when(
      // On successful fetch, emit success state with order details
      success: (final data) {
        emit(OrderDetailsState.success(orderDetails: data));
      },
      // On fetch failure, emit failure state with error information
      failure: (final error) {
        emit(OrderDetailsState.failure(error: error));
      },
    );
  }
}
