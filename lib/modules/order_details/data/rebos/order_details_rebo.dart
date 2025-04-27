import 'package:alalamia_admin/core/data/data_result.dart';
import 'package:alalamia_admin/core/extension/order_status_ext.dart';
import 'package:alalamia_admin/core/networking/api_service.dart';
import 'package:alalamia_admin/core/networking/api_try_catch.dart';
import 'package:alalamia_admin/modules/order_details/data/models/change_order_status_request_model.dart';
import 'package:alalamia_admin/modules/order_details/data/models/orders_details_response_model/orders_details_response_model.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/order_status.dart';

class OrderDetailsRebo {
  final ApiService apiService;

  OrderDetailsRebo(this.apiService);
  Future<DataResult<OrdersDetailsResponseModel>> getOrderDetails(
    final String orderId,
  ) async => apiTryCatch(apiCall: apiService.orderDetails(orderId));

  Future<DataResult<void>> changeOrderStatus(
    final String orderId,
    final OrderStatus orderStatus,
  ) async => apiTryCatch(
    apiCall: apiService.changeOrderStatus(
      orderId,
      ChangeOrderStatusRequestModel(status: orderStatus.statusString),
    ),
  );
}
