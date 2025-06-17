// ignore_for_file: unintended_html_in_doc_comment

import 'package:alalamia_admin/core/data/data_result.dart';
import 'package:alalamia_admin/core/errors/app_error.dart';
import 'package:dio/dio.dart';

/// Generic API call wrapper that provides consistent error handling
/// Wraps any API call in try-catch and converts results to DataResult pattern
/// [RS] - Generic type representing the expected API response type
///
/// Usage: apiTryCatch(apiCall: someApiService.getData())
/// Returns: DataResult<T> with either success data or error information
Future<DataResult<RS>> apiTryCatch<RS>({
  required final Future<RS> apiCall,
}) async {
  try {
    // Execute the API call and wait for response
    final response = await apiCall;
    // Wrap successful response in DataResult.success
    return DataResult.success(data: response);
  } on DioException catch (e) {
    // Handle Dio-specific network/HTTP errors
    // Convert to ApiError with proper error details
    return DataResult.failure(
      error: ApiError.fromDioException(dioException: e),
    );
  } on Exception {
    // Handle any other unexpected exceptions
    // Convert to generic ApiError for unknown errors
    return DataResult.failure(error: ApiError.fromUnknown());
  }
}
