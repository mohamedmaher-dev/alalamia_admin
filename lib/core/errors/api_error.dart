part of 'error_interface.dart';

class ApiError extends ErrorInterface {
  ApiError({required super.msg, required super.code});

  factory ApiError.fromDioException({required DioException dioException}) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(msg: "Connection Timeout", code: 0);
      case DioExceptionType.sendTimeout:
        return ApiError(msg: "Send Timeout", code: 0);
      case DioExceptionType.receiveTimeout:
        return ApiError(msg: "Receive Timeout", code: 0);
      case DioExceptionType.badCertificate:
        return ApiError(msg: "Bad Certificate", code: 0);
      case DioExceptionType.badResponse:
        return _fromBadResponse(dioException: dioException);
      case DioExceptionType.cancel:
        return ApiError(msg: "Connection Canceled", code: 0);
      case DioExceptionType.connectionError:
        return ApiError(msg: "Connection Error", code: 0);
      case DioExceptionType.unknown:
        return ApiError(msg: Language.current.unknown_error, code: 0);
    }
  }
  factory ApiError.fromUnknown() {
    return ApiError(msg: Language.current.unknown_error, code: 0);
  }
}

ApiError _fromBadResponse({required DioException dioException}) {
  final int code = dioException.response!.statusCode ?? 0;
  final Response? response = dioException.response;
  switch (code) {
    case 400:
      try {
        return ApiError(
          msg: response!.data['error']['password'][0],
          code: code,
        );
      } catch (e) {
        try {
          return ApiError(msg: response!.data['message'], code: code);
        } catch (e) {
          return ApiError.fromUnknown();
        }
      }
    case 401:
      return ApiError(msg: response!.data['error'], code: code);
    default:
      return ApiError.fromUnknown();
  }
}
