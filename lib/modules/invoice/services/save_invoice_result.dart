import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_invoice_result.freezed.dart';

@freezed
abstract class SaveInvoiceResult<T> with _$SaveInvoiceResult<T> {
  const factory SaveInvoiceResult.success(final T data) = Sucess<T>;
  const factory SaveInvoiceResult.failure(final String e) = Failure<T>;
}
