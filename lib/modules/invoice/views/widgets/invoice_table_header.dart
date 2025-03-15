part of '../invoice_view.dart';

Widget _invoiceTableHeader({required Font font}) {
  return pw.Container(
    margin: const pw.EdgeInsets.only(bottom: 10),
    alignment: pw.Alignment.center,
    child: pw.Table(
      columnWidths: {
        0: pw.FlexColumnWidth(1),
        1: pw.FlexColumnWidth(1),
        2: pw.FlexColumnWidth(1),
        3: pw.FlexColumnWidth(1),
        4: pw.FlexColumnWidth(2),
      },
      children: [
        pw.TableRow(
          children:
              [
                pw.Padding(
                  padding: pw.EdgeInsets.all(kNormalPadding),
                  child: pw.Text(
                    'اسم المنتج',
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
                    'رقم المنتج',
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
                    'الكمية',
                    style: pw.TextStyle(
                      font: font,
                      fontSize: 15,
                      fontWeight: pw.FontWeight.bold,
                    ),
                    textAlign: pw.TextAlign.center,
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(kNormalPadding),
                  child: pw.Text(
                    'الوحدة',
                    style: pw.TextStyle(
                      font: font,
                      fontSize: 15,
                      fontWeight: pw.FontWeight.bold,
                    ),
                    textAlign: pw.TextAlign.center,
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(kNormalPadding),
                  child: pw.Text(
                    'السعر',
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
