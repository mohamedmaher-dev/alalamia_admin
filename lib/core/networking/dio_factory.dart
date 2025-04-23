import 'package:alalamia_admin/core/local_storage/local_storage_service.dart';
import 'package:alalamia_admin/core/router/app_router.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? _dio;

  static Dio getDio(LocalStorageService localStorageService) {
    final userCredential = localStorageService.userCredential;
    if (_dio == null) {
      const Duration timout = Duration(seconds: 30);
      _dio = Dio();
      _dio!
        ..options.connectTimeout = timout
        ..options.sendTimeout = timout
        ..options.receiveTimeout = timout
        ..options.headers['Authorization'] =
            userCredential == null ? '' : "Bearer ${userCredential.token}"
        ..interceptors.add(
          InterceptorsWrapper(
            onError: (error, handler) async {
              if (error.response?.statusCode == 401 &&
                  AppRouter.currentPage != AppPages.signIn) {
                AppRouter.pushReplacement(AppPages.splash);
              }
              return handler.next(error);
            },
          ),
        )
        ..interceptors.add(
          PrettyDioLogger(
            request: true,
            requestBody: true,
            responseBody: true,
            requestHeader: true,
          ),
        );
      return _dio!;
    } else {
      return _dio!;
    }
  }

  static void setToken(String token) {
    _dio!.options.headers['Authorization'] = 'Bearer $token';
  }
}
