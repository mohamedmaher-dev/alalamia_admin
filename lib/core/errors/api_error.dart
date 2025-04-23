part of 'app_error.dart';

class ApiError extends AppError {
  ApiError._({required super.msg, super.code = 0});

  factory ApiError.fromUnknown() {
    return ApiError._(msg: Language.current.unknown_error);
  }

  factory ApiError.fromDioException({required DioException dioException}) {
    final language = Language.current;
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError._(msg: language.connection_timeout);
      case DioExceptionType.sendTimeout:
        return ApiError._(msg: language.send_timeout);
      case DioExceptionType.receiveTimeout:
        return ApiError._(msg: language.receive_timeout);
      case DioExceptionType.badCertificate:
        return ApiError._(msg: language.bad_certificate);
      case DioExceptionType.badResponse:
        return _fromBadResponse(dioException: dioException);
      case DioExceptionType.cancel:
        return ApiError._(msg: language.connection_canceled);
      case DioExceptionType.connectionError:
        return ApiError._(msg: language.connection_error);
      case DioExceptionType.unknown:
        return ApiError.fromUnknown();
    }
  }
  static ApiError _fromBadResponse({required DioException dioException}) {
    final int code = dioException.response!.statusCode ?? 0;
    final Response? response = dioException.response;
    switch (code) {
      case 400:
        try {
          return ApiError._(
            msg: response!.data['error']['password'][0],
            code: code,
          );
        } catch (e) {
          try {
            return ApiError._(msg: response!.data['message'], code: code);
          } catch (e) {
            return ApiError.fromUnknown();
          }
        }
      case 401:
        return ApiError._(msg: response!.data['error'], code: code);
      default:
        return ApiError.fromUnknown();
    }
  }
}
