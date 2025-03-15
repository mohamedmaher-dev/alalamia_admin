part of 'invoice_cubit.dart';

@freezed
class InvoiceState with _$InvoiceState {
  const factory InvoiceState.initial() = _Initial;
  const factory InvoiceState.showLoading() = _ShowLoading;
  const factory InvoiceState.showFailure() = _ShowFailure;
  const factory InvoiceState.showSuccess({
    required Uint8List pdfData,
    required InvoiceCubit cubit,
    required OrdersDetailsResponseModel order,
  }) = _ShowSuccess;
  const factory InvoiceState.saveLoading() = _SaveLoading;
  const factory InvoiceState.saveSuccess() = _SaveSuccess;
  const factory InvoiceState.saveFailure() = _SaveFailure;
}
