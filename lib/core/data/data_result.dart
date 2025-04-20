import 'package:alalamia_admin/core/errors/error_interface.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'data_result.freezed.dart';

@Freezed()
abstract class DataResult<T> with _$DataResult<T> {
  const factory DataResult.success(T data) = Success<T>;
  const factory DataResult.error(ErrorInterface error) = Error;
}
