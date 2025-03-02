import 'package:alalamia_admin/core/networking/api_result.dart';
import 'package:alalamia_admin/core/networking/api_try_catch.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders/orders_response_model.dart';
import 'package:alalamia_admin/modules/orders/services/api_orders_service.dart';

class OrdersRebo {
  final ApiOrdersService apiOrdersService;
  OrdersRebo({required this.apiOrdersService});
  Future<ApiResult<OrdersResponseModel>> getOrders() =>
      apiTryCatch(apiCall: apiOrdersService.getOrders(1));
}
