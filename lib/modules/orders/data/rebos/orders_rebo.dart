import 'package:alalamia_admin/core/data/data_result.dart';
import 'package:alalamia_admin/core/local_storage/local_storage_service.dart';
import 'package:alalamia_admin/core/networking/api_service.dart';
import 'package:alalamia_admin/core/networking/api_try_catch.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/orders_response_model.dart';

class OrdersRebo {
  final ApiService apiOrdersService;
  final LocalStorageService localStorageService;
  OrdersRebo({
    required this.apiOrdersService,
    required this.localStorageService,
  });

  Future<OrdersResponseModel> getOrders(int page) {
    final userCredential = localStorageService.userCredential!;
    return apiOrdersService.getOrders(page, userCredential.countryId);
  }

  Future<DataResult<OrdersResponseModel>> getOrdersWithApiResult(int page) {
    final userCredential = localStorageService.userCredential!;
    return apiTryCatch(
      apiCall: apiOrdersService.getOrders(page, userCredential.countryId),
    );
  }
}
