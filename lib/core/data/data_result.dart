import 'package:alalamia_admin/core/errors/app_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_result.freezed.dart';

@freezed
abstract class DataResult<T> with _$DataResult<T> {
  const factory DataResult.success({required final T data}) = Success<T>;
  const factory DataResult.failure({required final AppError error}) =
      Failure<T>;
}
