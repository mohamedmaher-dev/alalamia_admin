import 'dart:io';
import 'dart:typed_data';
import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/modules/invoice/services/save_invoice_result.dart';
import 'package:alalamia_admin/modules/invoice/views/invoice_view.dart';
import 'package:alalamia_admin/modules/order_details/data/models/orders_details_response_model/orders_details_response_model.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart';
import 'package:external_path/external_path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
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
      bool isGranted = await isPermissionGranted();
      if (!isGranted) isGranted = await requestPermission();
      if (!isGranted) {
        return SaveInvoiceResult.failure(
          Language.current.permission_not_granted,
        );
      } else {
        late String folder;
        if (Platform.isAndroid) {
          folder = await ExternalPath.getExternalStoragePublicDirectory(
            ExternalPath.DIRECTORY_DOCUMENTS,
          );
        } else {
          final folderDirectory = await getApplicationDocumentsDirectory();
          folder = folderDirectory.path;
        }
        final file = File('$folder/${order.requestNo}.pdf');
        await file.create(recursive: true);
        await file.writeAsBytes(pdfData);
        return SaveInvoiceResult.success(XFile(file.path));
      }
    } on Exception catch (e) {
      return SaveInvoiceResult.failure(e.toString());
    }
  }

  Future<bool> requestPermission() async {
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
    return await isPermissionGranted();
  }

  Future<bool> isPermissionGranted() async {
    final status1 = await Permission.storage.status;
    final status2 = await Permission.manageExternalStorage.status;
    return status1.isGranted || status2.isGranted;
  }
}
