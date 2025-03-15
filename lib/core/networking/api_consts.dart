class ApiConsts {
  ApiConsts._();
  // Auth
  static const signIn = 'auth/login';
  // Orders
  static const orders = 'orders';
  static const orderDetails = 'orders/showDetails/{orderId}';
  static const orderStatus = 'orders/update/status/{orderId}';
  // Statstics
  static const statistics = 'orders/statistics';
}
