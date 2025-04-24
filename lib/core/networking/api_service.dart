import 'package:alalamia_admin/core/networking/api_consts.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/models/sign_in_request_model.dart';
import 'package:alalamia_admin/modules/auth/sign_in/data/models/sign_in_response_model.dart';
import 'package:alalamia_admin/modules/order_details/data/models/change_order_status_request_model.dart';
import 'package:alalamia_admin/modules/order_details/data/models/orders_details_response_model/orders_details_response_model.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/orders_response_model.dart';
import 'package:alalamia_admin/modules/statistics/data/models/statistics_response_model/statistics_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(final Dio dio, {required final String baseUrl}) =
      _ApiService;
  // Auth
  @POST(ApiConsts.signIn)
  Future<SignInResponseModel> signIn(
    @Body() final SignInRequestModel signInRequestModel,
  );
  // Orders
  @GET(ApiConsts.orders)
  Future<OrdersResponseModel> getOrders(
    @Query('page') final int page,
    @Query('country_id') final int countryId,
  );
  @GET(ApiConsts.orderDetails)
  Future<OrdersDetailsResponseModel> orderDetails(
    @Path('orderId') final String orderId,
  );

  @PUT(ApiConsts.orderStatus)
  Future<void> changeOrderStatus(
    @Path('orderId') final String orderId,
    @Body() final ChangeOrderStatusRequestModel changeOrderStatusRequestModel,
  );
  // Statistics
  @GET(ApiConsts.statistics)
  Future<StatisticsResponseModel> getStatistics();
}
