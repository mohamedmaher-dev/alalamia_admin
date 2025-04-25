import 'dart:io';
import 'dart:typed_data';

import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/modules/invoice/services/save_invoice_result.dart';
import 'package:alalamia_admin/modules/invoice/views/invoice_view.dart';
import 'package:alalamia_admin/modules/order_details/data/models/orders_details_response_model/orders_details_response_model.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart';
import 'package:external_path/external_path.dart';
import 'package:permission_handler/permission_handler.dart';

class InvoiceRebo {
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

  Future<SaveInvoiceResult<void>> saveInvoice(
    final OrdersDetailsResponseModel order,
    final Uint8List pdfData,
  ) async {
    try {
      bool isGranted = await _isPermissionGranted();
      if (!isGranted) isGranted = await _requestPermission();
      if (!isGranted) {
        return SaveInvoiceResult.failure(
          Language.current.permission_not_granted,
        );
      } else {
        final folder = await ExternalPath.getExternalStoragePublicDirectory(
          ExternalPath.DIRECTORY_DOCUMENTS,
        );
        final file = File('$folder/${order.requestNo}.pdf');
        await file.create(recursive: true);
        await file.writeAsBytes(pdfData);
        return const SaveInvoiceResult.success(null);
      }
    } on Exception catch (e) {
      return SaveInvoiceResult.failure(e.toString());
    }
  }

  Future<bool> _requestPermission() async {
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
    return await _isPermissionGranted();
  }

  Future<bool> _isPermissionGranted() async {
    final status1 = await Permission.storage.status;
    final status2 = await Permission.manageExternalStorage.status;
    return status1.isGranted || status2.isGranted;
  }
}
