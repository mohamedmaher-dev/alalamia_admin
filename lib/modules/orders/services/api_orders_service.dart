import 'package:alalamia_admin/modules/orders/data/models/orders/orders_response_model.dart';
import 'package:alalamia_admin/modules/orders/services/api_orders_consts.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'api_orders_service.g.dart';

@RestApi()
abstract class ApiOrdersService {
  factory ApiOrdersService(Dio dio, {required String baseUrl}) =
      _ApiOrdersService;
  @GET(ApiOrdersConsts.orders)
  Future<OrdersResponseModel> getOrders(@Query("page") int page);
}
