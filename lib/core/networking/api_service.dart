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

/// REST API service interface for Alalamia Admin application
/// Uses Retrofit annotations to generate HTTP client implementation
/// Provides methods for authentication, order management, and statistics
@RestApi()
abstract class ApiService {
  /// Factory constructor to create ApiService instance with Dio client
  /// [dio] - HTTP client instance configured with interceptors
  /// [baseUrl] - Base URL for all API endpoints
  factory ApiService(final Dio dio, {required final String baseUrl}) =
      _ApiService;

  // Authentication API methods

  /// Authenticate admin user with email and password
  /// [signInRequestModel] - Contains user credentials for authentication
  /// Returns [SignInResponseModel] with user data and access token
  @POST(ApiConsts.signIn)
  Future<SignInResponseModel> signIn(
    @Body() final SignInRequestModel signInRequestModel,
  );

  // Order management API methods

  /// Fetch paginated list of orders with country filtering
  /// [page] - Page number for pagination (starts from 1)
  /// [countryId] - Country identifier to filter orders by location
  /// Returns [OrdersResponseModel] containing list of orders and pagination info
  @GET(ApiConsts.orders)
  Future<OrdersResponseModel> getOrders(
    @Query('page') final int page,
    @Query('country_id') final int countryId,
  );

  /// Get detailed information for a specific order
  /// [orderId] - Unique identifier of the order to fetch details for
  /// Returns [OrdersDetailsResponseModel] with complete order information
  @GET(ApiConsts.orderDetails)
  Future<OrdersDetailsResponseModel> orderDetails(
    @Path('orderId') final String orderId,
  );

  /// Update the status of a specific order (e.g., confirmed, shipped, delivered)
  /// [orderId] - Unique identifier of the order to update
  /// [changeOrderStatusRequestModel] - New status information for the order
  @PUT(ApiConsts.orderStatus)
  Future<void> changeOrderStatus(
    @Path('orderId') final String orderId,
    @Body() final ChangeOrderStatusRequestModel changeOrderStatusRequestModel,
  );

  // Analytics and reporting API methods

  /// Fetch statistical data and analytics for orders
  /// Returns [StatisticsResponseModel] with metrics like total orders, revenue, etc.
  @GET(ApiConsts.statistics)
  Future<StatisticsResponseModel> getStatistics();
}
