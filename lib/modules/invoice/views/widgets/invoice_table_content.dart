part of '../invoice_view.dart';

Widget _invoiceTableContent({required Font font, required OrderItem order}) {
  return pw.Table(
    columnWidths: {
      0: pw.FlexColumnWidth(1),
      1: pw.FlexColumnWidth(1),
      2: pw.FlexColumnWidth(2),
    },
    children: List.generate(order.cart.items.length, (index) {
      return pw.TableRow(
        decoration:
            index % 2 == 0 ? pw.BoxDecoration(color: PdfColors.grey100) : null,
        children:
            [
              pw.Padding(
                padding: pw.EdgeInsets.all(kNormalPadding),
                child: pw.Text(
                  order.cart.items[index].productName,
                  style: pw.TextStyle(font: font, fontSize: 12),
                ),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.all(kNormalPadding),
                child: pw.Text(
                  order.cart.items[index].pivot.quantity,
                  style: pw.TextStyle(font: font, fontSize: 12),
                  textAlign: pw.TextAlign.center,
                ),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.all(kNormalPadding),
                child: pw.Text(
                  order.cart.items[index].itemPrice,
                  style: pw.TextStyle(font: font, fontSize: 12),
                  textAlign: pw.TextAlign.center,
                ),
              ),
            ].reversed.toList(),
      );
    }),
    border: TableBorder.all(
      color: PdfColors.black,
      style: pw.BorderStyle.dashed,
    ),
  );
}
