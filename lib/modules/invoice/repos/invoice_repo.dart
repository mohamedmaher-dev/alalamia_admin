import 'dart:io';
import 'dart:typed_data';
import 'package:alalamia_admin/modules/invoice/services/save_invoice_result.dart';
import 'package:alalamia_admin/modules/invoice/views/invoice_view.dart';
import 'package:alalamia_admin/modules/order_details/data/models/orders_details_response_model/orders_details_response_model.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class InvoiceRepo {
  Future<SaveInvoiceResult<Uint8List>> createPdfData(
    final OrdersDetailsResponseModel order,
    final OrdersDatum orderDetailsArgs,
  ) async {
    try {
      final pdfData = await createStyledInvoice(order, orderDetailsArgs);
      return SaveInvoiceResult.success(pdfData);
    } on Exception catch (e) {
      return SaveInvoiceResult.failure(e.toString());
    }
  }

  Future<SaveInvoiceResult<XFile>> saveInvoice(
    final OrdersDetailsResponseModel order,
    final Uint8List pdfData,
  ) async {
    try {
      final folderDirectory = await getApplicationDocumentsDirectory();
      final folderPath = folderDirectory.path;
      final file = File('$folderPath/invoice.pdf');
      await file.create(recursive: true);
      await file.writeAsBytes(pdfData);
      return SaveInvoiceResult.success(XFile(file.path));
    } on Exception catch (e) {
      return SaveInvoiceResult.failure(e.toString());
    }
  }
}
