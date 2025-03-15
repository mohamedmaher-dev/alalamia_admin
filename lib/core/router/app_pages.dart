part of 'app_router.dart';

enum AppPages {
  signIn(path: '/auth/signIn'),
  home(path: '/home'),
  settings(path: '/settings'),
  orderDetails(path: '/orders/:orderId'),
  splash(path: '/');

  const AppPages({required this.path});
  final String path;
}
