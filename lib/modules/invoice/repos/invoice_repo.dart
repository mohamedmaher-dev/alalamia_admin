import 'dart:io';
import 'dart:typed_data';
import 'package:alalamia_admin/core/data/data_result.dart';
import 'package:alalamia_admin/core/errors/app_error.dart';
import 'package:alalamia_admin/modules/invoice/views/invoice_view.dart';
import 'package:alalamia_admin/modules/order_details/data/models/orders_details_response_model/orders_details_response_model.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

/// Repository for handling invoice PDF generation and file operations
/// Manages creating PDF documents from order data and saving them to device storage
/// Integrates with the invoice view for styled PDF generation
class InvoiceRepo {
  /// Generate PDF data bytes from order information
  /// [order] - Complete order details for PDF content
  /// [orderDetailsArgs] - Additional order data for context
  /// Returns DataResult with PDF bytes or error information
  Future<DataResult<Uint8List>> createPdfData(
    final OrdersDetailsResponseModel order,
    final OrdersDatum orderDetailsArgs,
  ) async {
    try {
      // Call the invoice view function to create styled PDF
      final pdfData = await createStyledInvoice(order, orderDetailsArgs);
      return DataResult.success(data: pdfData);
    } on Exception {
      // Handle any errors during PDF generation
      return DataResult.failure(error: UnknownError());
    }
  }

  /// Save generated PDF to device storage
  /// [order] - Order details for file naming and metadata
  /// [pdfData] - PDF bytes to save to file
  /// Returns DataResult with file reference or error information
  Future<DataResult<XFile>> saveInvoice(
    final OrdersDetailsResponseModel order,
    final Uint8List pdfData,
  ) async {
    try {
      // Get application documents directory for file storage
      final folderDirectory = await getApplicationDocumentsDirectory();
      final folderPath = folderDirectory.path;

      // Create file path for the PDF invoice
      final file = File('$folderPath/invoice.pdf');

      // Create file and any necessary parent directories
      await file.create(recursive: true);

      // Write PDF bytes to the file
      await file.writeAsBytes(pdfData);

      // Return XFile reference for sharing or further operations
      return DataResult.success(data: XFile(file.path));
    } on Exception {
      // Handle any file system or storage errors
      return DataResult.failure(error: UnknownError());
    }
  }
}
