import 'package:alalamia_admin/core/data/data_result.dart';
import 'package:alalamia_admin/core/local_storage/local_storage_service.dart';
import 'package:alalamia_admin/core/networking/api_service.dart';
import 'package:alalamia_admin/core/networking/api_try_catch.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/orders_response_model.dart';

/// Repository for managing orders data access and operations
/// Handles fetching orders from API with pagination and country filtering
/// Integrates with local storage to get user context (country) for filtering
class OrdersRepo {
  /// API service for orders network requests
  final ApiService apiOrdersService;

  /// Local storage service for accessing saved user credentials
  final LocalStorageService localStorageService;

  /// Initialize repository with required service dependencies
  OrdersRepo({
    required this.apiOrdersService,
    required this.localStorageService,
  });

  /// Fetch orders for a specific page (direct API call)
  /// [page] - Page number for pagination (starts from 1)
  /// Returns OrdersResponseModel directly from API
  /// Uses saved user's country ID for filtering relevant orders
  Future<OrdersResponseModel> getOrders(final int page) {
    // Get user credentials from local storage for country filtering
    final userCredential = localStorageService.userCredential!;

    // Call API with page number and user's country ID
    return apiOrdersService.getOrders(page, userCredential.countryId);
  }

  /// Fetch orders with error handling wrapper (wrapped API call)
  /// [page] - Page number for pagination (starts from 1)
  /// Returns DataResult wrapping success/failure states
  /// Used when explicit error handling is needed
  Future<DataResult<OrdersResponseModel>> getOrdersWithApiResult(
    final int page,
  ) {
    // Get user credentials from local storage for country filtering
    final userCredential = localStorageService.userCredential!;

    // Use API try-catch wrapper for consistent error handling
    return apiTryCatch(
      apiCall: apiOrdersService.getOrders(page, userCredential.countryId),
    );
  }
}
