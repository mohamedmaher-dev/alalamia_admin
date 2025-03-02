import 'package:dio/dio.dart';

import 'api_error_model.dart';
import 'api_result.dart';

Future<ApiResult<RS>> apiTryCatch<RS>({
  required Future<RS> apiCall,
}) async {
  try {
    final response = await apiCall;
    return ApiResult.success(response);
  } on DioException catch (e) {
    return ApiResult.failure(ApiErrorModel.fromDioException(dioException: e));
  } catch (e) {
    return ApiResult.failure(ApiErrorModel.fromUnknown(e: e));
  }
}
