import 'package:alalamia_admin/core/errors/app_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_result.freezed.dart';

/// Generic result wrapper for handling success and failure states
/// This class implements the Result pattern to handle operations that can either
/// succeed with data or fail with an error in a type-safe way
///
/// [T] - The type of data returned on successful operations
@freezed
abstract class DataResult<T> with _$DataResult<T> {
  /// Success state containing the operation result data
  /// [data] - The successful result of the operation
  const factory DataResult.success({required final T data}) = Success<T>;

  /// Failure state containing error information
  /// [error] - The error that occurred during the operation
  const factory DataResult.failure({required final AppError error}) =
      Failure<T>;
}
