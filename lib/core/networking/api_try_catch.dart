import 'package:alalamia_admin/core/data/data_result.dart';
import 'package:alalamia_admin/core/errors/error_interface.dart';
import 'package:dio/dio.dart';

Future<DataResult<RS>> apiTryCatch<RS>({required Future<RS> apiCall}) async {
  try {
    final response = await apiCall;
    return DataResult.success(response);
  } on DioException catch (e) {
    return DataResult.error(ApiError.fromDioException(dioException: e));
  } catch (e) {
    return DataResult.error(ApiError.fromUnknown());
  }
}
