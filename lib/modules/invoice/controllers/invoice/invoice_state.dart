part of 'invoice_cubit.dart';

/// State management for invoice PDF generation and saving operations
/// Handles different states for showing and saving invoice PDFs
@freezed
class InvoiceState with _$InvoiceState {
  /// Initial state when invoice screen is first loaded
  const factory InvoiceState.initial() = _Initial;

  /// Loading state while generating PDF for display
  const factory InvoiceState.showLoading() = _ShowLoading;

  /// Failure state when PDF generation for display fails
  const factory InvoiceState.showFailure() = _ShowFailure;

  /// Success state when PDF is generated and ready for display
  /// [pdfData] - The generated PDF data as bytes
  /// [cubit] - Reference to the cubit for additional operations
  /// [order] - The order details used for PDF generation
  const factory InvoiceState.showSuccess({
    required final Uint8List pdfData,
    required final InvoiceCubit cubit,
    required final OrdersDetailsResponseModel order,
  }) = _ShowSuccess;

  /// Loading state while saving PDF to device
  const factory InvoiceState.saveLoading() = _SaveLoading;

  /// Success state when PDF is saved to device
  /// [file] - The saved file reference for sharing or opening
  const factory InvoiceState.saveSuccess({required final XFile file}) =
      _SaveSuccess;

  /// Failure state when saving PDF to device fails
  const factory InvoiceState.saveFailure() = _SaveFailure;
}
