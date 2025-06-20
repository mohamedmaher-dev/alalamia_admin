import 'dart:typed_data';

import 'package:alalamia_admin/modules/invoice/repos/invoice_repo.dart';
import 'package:alalamia_admin/modules/order_details/data/models/orders_details_response_model/orders_details_response_model.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_plus/share_plus.dart';

part 'invoice_state.dart';
part 'invoice_cubit.freezed.dart';

/// Cubit for managing invoice PDF generation and file operations
/// Handles creating PDF invoices from order data and saving them to device
/// Integrates with invoice repository for PDF creation and file management
class InvoiceCubit extends Cubit<InvoiceState> {
  /// Repository for invoice PDF operations (creation, saving, sharing)
  final InvoiceRepo invoiceRepo = InvoiceRepo();

  /// Initialize the cubit with initial state
  InvoiceCubit() : super(const InvoiceState.initial());

  /// Generate and display PDF invoice for an order
  /// [order] - Complete order details for PDF generation
  /// [args] - Basic order data for additional context
  /// Emits loading state during generation, then success or failure
  Future<void> show(
    final OrdersDetailsResponseModel order,
    final OrdersDatum args,
  ) async {
    // Show loading state during PDF generation
    emit(const InvoiceState.showLoading());

    // Call repository to create PDF data from order information
    final result = await invoiceRepo.createPdfData(order, args);

    // Handle the PDF generation result
    result.when(
      // On successful PDF generation, emit success with PDF data
      success:
          (final data) => emit(
            InvoiceState.showSuccess(pdfData: data, cubit: this, order: order),
          ),
      // On failure, emit failure state
      failure: (final e) => emit(const InvoiceState.showFailure()),
    );
  }

  /// Save the generated PDF invoice to device storage
  /// [order] - Order details for naming and metadata
  /// [pdf] - The PDF data bytes to save
  /// Emits loading state during save operation, then success or failure
  Future<void> save(
    final OrdersDetailsResponseModel order,
    final Uint8List pdf,
  ) async {
    // Show loading state during save operation
    emit(const InvoiceState.saveLoading());

    // Call repository to save PDF to device
    final result = await invoiceRepo.saveInvoice(order, pdf);

    // Handle the save operation result
    result.when(
      // On successful save, emit success with file reference
      success: (final file) => emit(InvoiceState.saveSuccess(file: file)),
      // On failure, emit failure state
      failure: (final e) => emit(const InvoiceState.saveFailure()),
    );
  }
}
