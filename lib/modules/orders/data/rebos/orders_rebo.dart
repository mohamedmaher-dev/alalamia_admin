import 'package:alalamia_admin/modules/orders/data/models/orders/orders_response_model.dart';
import 'package:alalamia_admin/modules/orders/services/api_orders_service.dart';

class OrdersRebo {
  final ApiOrdersService apiOrdersService;
  OrdersRebo({required this.apiOrdersService});

  Future<OrdersResponseModel> getOrders(int page) =>
      apiOrdersService.getOrders(page);
}
