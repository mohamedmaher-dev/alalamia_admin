/// API endpoint constants for the Alalamia Admin application
/// Contains all REST API endpoints used throughout the application
class ApiConsts {
  // Private constructor to prevent instantiation
  ApiConsts._();

  // Authentication endpoints
  /// User login endpoint for admin authentication
  static const signIn = 'auth/login';

  // Order management endpoints
  /// Get paginated list of orders with country filtering
  static const orders = 'orders';

  /// Get detailed information for a specific order by ID
  static const orderDetails = 'orders/showDetails/{orderId}';

  /// Update the status of a specific order
  static const orderStatus = 'orders/update/status/{orderId}';

  // Analytics and reporting endpoints
  /// Get statistical data and analytics for orders
  static const statistics = 'orders/statistics';
}
