import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_invoice_result.freezed.dart';

@freezed
abstract class SaveInvoiceResult<T> with _$SaveInvoiceResult<T> {
  const factory SaveInvoiceResult.success(T data) = Sucess<T>;
  const factory SaveInvoiceResult.failure(String e) = Failure<T>;
}
