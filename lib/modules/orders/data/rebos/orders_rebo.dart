import 'package:alalamia_admin/core/networking/api_service.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/orders_response_model.dart';

class OrdersRebo {
  final ApiService apiOrdersService;
  OrdersRebo({required this.apiOrdersService});

  Future<OrdersResponseModel> getOrders(int page) =>
      apiOrdersService.getOrders(page);
}
