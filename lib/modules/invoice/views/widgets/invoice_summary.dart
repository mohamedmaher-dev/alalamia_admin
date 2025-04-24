part of '../invoice_view.dart';

Widget _invoiceSummary({
  required Font font,
  required OrdersDetailsResponseModel order,
  required String currency,
}) => pw.Container(
  margin: const pw.EdgeInsets.only(bottom: 10),
  alignment: pw.Alignment.center,
  child: pw.Table(
    columnWidths: {
      0: const pw.FlexColumnWidth(),
      1: const pw.FlexColumnWidth(4),
    },
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
                  '${order.priceSum} $currency',
                  style: pw.TextStyle(
                    font: font,
                    fontSize: 15,
                    fontWeight: pw.FontWeight.bold,
                  ),
                  textAlign: pw.TextAlign.center,
                ),
              ),
            ].reversed.toList(),
        decoration: const pw.BoxDecoration(color: PdfColors.grey300),
      ),
    ],
  ),
);
