part of 'app_router.dart';

enum AppPages {
  signIn(path: '/auth/signIn'),
  home(path: '/home'),
  settings(path: '/settings'),
  oneOrder(path: '/orders/oneOrder'),
  splash(path: '/');

  const AppPages({required this.path});
  final String path;
}
