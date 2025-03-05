import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:alalamia_admin/core/utils/assets_manger.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders/orders_response_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:jiffy/jiffy.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:typed_data';
import 'package:pdf/widgets.dart';
part 'widgets/invoice_title.dart';
part 'widgets/invoice_info.dart';
part 'widgets/invoice_table_header.dart';
part 'widgets/invoice_table_content.dart';
part 'widgets/invoice_summary.dart';

Future<Uint8List> createStyledInvoice(OrderItem order) async {
  final fontData = await rootBundle.load(AssetsManger.fontsTajawalRegular);
  final font = pw.Font.ttf(fontData);
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      textDirection: pw.TextDirection.rtl,
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(32),
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Title
            _invoiceTitle(font: font),
            pw.SizedBox(height: kSpacingBetweenWidgetsHight),
            pw.Divider(thickness: 1),
            // Invoice Info
            pw.SizedBox(height: kSpacingBetweenWidgetsHight),
            _invoiceInfo(font: font, orderIem: order),
            // Table Header
            pw.SizedBox(height: kSpacingBetweenWidgetsHight),
            _invoiceTableHeader(font: font),
            // Table Content
            _invoiceTableContent(font: font, order: order),
            // Summary
            pw.SizedBox(height: kSpacingBetweenWidgetsHight),
            _invoiceSummary(font: font, order: order),
            pw.Divider(thickness: 1),
          ],
        );
      },
    ),
  );

  return await pdf.save();
}
