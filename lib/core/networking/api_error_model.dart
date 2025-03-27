import 'package:dio/dio.dart';

class ApiErrorModel {
  final String msg;
  final int code;
  ApiErrorModel({this.msg = "Unknown Error", this.code = 0});

  factory ApiErrorModel.fromUnknown({required Object e}) {
    return ApiErrorModel(msg: e.toString());
  }

  factory ApiErrorModel.fromDioException({required DioException dioException}) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ApiErrorModel(msg: "Connection Timeout");
      case DioExceptionType.sendTimeout:
        return ApiErrorModel(msg: "Send Timeout");
      case DioExceptionType.receiveTimeout:
        return ApiErrorModel(msg: "Receive Timeout");
      case DioExceptionType.badCertificate:
        return ApiErrorModel(msg: "Bad Certificate");
      case DioExceptionType.badResponse:
        return _fromBadResponse(dioException: dioException);
      case DioExceptionType.cancel:
        return ApiErrorModel(msg: "Connection Canceled");
      case DioExceptionType.connectionError:
        return ApiErrorModel(msg: "Connection Error");
      case DioExceptionType.unknown:
        return ApiErrorModel();
    }
  }
}

ApiErrorModel _fromBadResponse({required DioException dioException}) {
  final int code = dioException.response!.statusCode ?? 0;
  final Response? response = dioException.response;
  switch (code) {
    case 400:
      try {
        return ApiErrorModel(
          msg: response!.data['error']['password'][0],
          code: code,
        );
      } catch (e) {
        try {
          return ApiErrorModel(msg: response!.data['message'], code: code);
        } catch (e) {
          return ApiErrorModel();
        }
      }
    case 401:
      return ApiErrorModel(msg: response!.data['error'], code: code);
    default:
      return ApiErrorModel();
  }
}
