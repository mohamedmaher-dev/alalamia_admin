import 'package:freezed_annotation/freezed_annotation.dart';

part 'fcm_result.freezed.dart';

@freezed
abstract class FcmResult<T> with _$FcmResult<T> {
  const factory FcmResult.success(T data) = Sucess<T>;
  const factory FcmResult.failure(String e) = Failure<T>;
}
