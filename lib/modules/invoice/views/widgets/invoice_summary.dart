part of '../invoice_view.dart';

Widget _invoiceSummary({required Font font, required OrderItem order}) {
  return pw.Container(
    margin: const pw.EdgeInsets.only(bottom: 10),
    alignment: pw.Alignment.center,
    child: pw.Table(
      columnWidths: {0: pw.FlexColumnWidth(1), 1: pw.FlexColumnWidth(3)},
      children: [
        pw.TableRow(
          children:
              [
                pw.Padding(
                  padding: pw.EdgeInsets.all(kNormalPadding),
                  child: pw.Text(
                    'المجموع',
                    style: pw.TextStyle(
                      font: font,
                      fontSize: 15,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(kNormalPadding),
                  child: pw.Text(
                    "${order.cart.priceSum.toString()} ${order.cart.user.wallet.currencyName}",
                    style: pw.TextStyle(
                      font: font,
                      fontSize: 15,
                      fontWeight: pw.FontWeight.bold,
                    ),
                    textAlign: pw.TextAlign.center,
                  ),
                ),
              ].reversed.toList(),
          decoration: pw.BoxDecoration(color: PdfColors.grey300),
        ),
      ],
    ),
  );
}
