import 'package:alalamia_admin/core/data/data_result.dart';
import 'package:alalamia_admin/core/errors/app_error.dart';
import 'package:dio/dio.dart';

Future<DataResult<RS>> apiTryCatch<RS>({
  required final Future<RS> apiCall,
}) async {
  try {
    final response = await apiCall;
    return DataResult.success(data: response);
  } on DioException catch (e) {
    return DataResult.failure(
      error: ApiError.fromDioException(dioException: e),
    );
  } on Exception {
    return DataResult.failure(error: ApiError.fromUnknown());
  }
}
