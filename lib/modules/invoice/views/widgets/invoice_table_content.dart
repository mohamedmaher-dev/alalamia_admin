part of '../invoice_view.dart';

Widget _invoiceTableContent({
  required Font font,
  required OrdersDetailsResponseModel order,
}) {
  return pw.Table(
    columnWidths: {
      0: pw.FlexColumnWidth(1),
      1: pw.FlexColumnWidth(1),
      2: pw.FlexColumnWidth(1),
      3: pw.FlexColumnWidth(1),
      4: pw.FlexColumnWidth(2),
    },
    children: List.generate(order.cartDetail!.length, (index) {
      return pw.TableRow(
        decoration:
            index % 2 == 0 ? pw.BoxDecoration(color: PdfColors.grey100) : null,
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
      );
    }),
    border: TableBorder.all(
      color: PdfColors.black,
      style: pw.BorderStyle.dashed,
    ),
  );
}
