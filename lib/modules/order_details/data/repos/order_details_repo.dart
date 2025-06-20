import 'package:alalamia_admin/core/data/data_result.dart';
import 'package:alalamia_admin/core/extension/order_status_ext.dart';
import 'package:alalamia_admin/core/networking/api_service.dart';
import 'package:alalamia_admin/core/networking/api_try_catch.dart';
import 'package:alalamia_admin/modules/order_details/data/models/change_order_status_request_model.dart';
import 'package:alalamia_admin/modules/order_details/data/models/orders_details_response_model/orders_details_response_model.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/order_status.dart';

/// Repository for managing individual order details and operations
/// Handles fetching detailed order information and updating order status
/// Provides data access layer with error handling for order management
class OrderDetailsRepo {
  /// API service for order details network requests
  final ApiService apiService;

  /// Initialize repository with API service dependency
  OrderDetailsRepo(this.apiService);

  /// Fetch detailed information for a specific order
  /// [orderId] - Unique identifier of the order to retrieve
  /// Returns DataResult with complete order details or error
  /// Includes customer info, items, pricing, status, and history
  Future<DataResult<OrdersDetailsResponseModel>> getOrderDetails(
    final String orderId,
  ) async => apiTryCatch(apiCall: apiService.orderDetails(orderId));

  /// Update the status of a specific order
  /// [orderId] - Unique identifier of the order to update
  /// [orderStatus] - New status to set for the order
  /// Returns DataResult indicating success or failure of the operation
  /// Used by admin to change order status (confirmed, shipped, delivered, etc.)
  Future<DataResult<void>> changeOrderStatus(
    final String orderId,
    final OrderStatus orderStatus,
  ) async => apiTryCatch(
    apiCall: apiService.changeOrderStatus(
      orderId,
      // Convert OrderStatus enum to request model with status string
      ChangeOrderStatusRequestModel(status: orderStatus.statusString),
    ),
  );
}
