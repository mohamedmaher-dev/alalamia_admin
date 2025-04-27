part of '../invoice_view.dart';

Widget _invoiceTableContent({
  required final Font font,
  required final OrdersDetailsResponseModel order,
}) => pw.Table(
  columnWidths: {
    0: const pw.FlexColumnWidth(),
    1: const pw.FlexColumnWidth(),
    2: const pw.FlexColumnWidth(),
    3: const pw.FlexColumnWidth(),
    4: const pw.FlexColumnWidth(2),
  },
  children: List.generate(
    order.cartDetail!.length,
    (final index) => pw.TableRow(
      decoration:
          index % 2 == 0
              ? const pw.BoxDecoration(color: PdfColors.grey100)
              : null,
      children:
          [
            pw.Padding(
              padding: pw.EdgeInsets.all(kNormalPadding),
              child: pw.Text(
                order.cartDetail![index].productAr!,
                style: pw.TextStyle(font: font, fontSize: 12),
              ),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.all(kNormalPadding),
              child: pw.Text(
                order.cartDetail![index].sku,
                style: pw.TextStyle(font: font, fontSize: 12),
                textAlign: pw.TextAlign.center,
              ),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.all(kNormalPadding),
              child: pw.Text(
                order.cartDetail![index].quantity!,
                style: pw.TextStyle(font: font, fontSize: 12),
                textAlign: pw.TextAlign.center,
              ),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.all(kNormalPadding),
              child: pw.Text(
                order.cartDetail![index].unit!.name!,
                style: pw.TextStyle(font: font, fontSize: 12),
                textAlign: pw.TextAlign.center,
              ),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.all(kNormalPadding),
              child: pw.Text(
                order.cartDetail![index].price!,
                style: pw.TextStyle(font: font, fontSize: 12),
                textAlign: pw.TextAlign.center,
              ),
            ),
          ].reversed.toList(),
    ),
  ),
  border: TableBorder.all(style: pw.BorderStyle.dashed),
);
