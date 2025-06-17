part of '../invoice_view.dart';

/// PDF invoice summary section widget displaying total price and currency
/// Creates a highlighted table row with total amount for invoice footer
/// Supports Arabic RTL layout with proper currency formatting for PDF output
Widget _invoiceSummary({
  required final Font font,
  required final OrdersDetailsResponseModel order,
  required final String currency,
}) => pw.Container(
  margin: const pw.EdgeInsets.only(bottom: 10),
  alignment: pw.Alignment.center,
  child: pw.Table(
    columnWidths: {
      // Label column (smaller width)
      0: const pw.FlexColumnWidth(),
      // Value column (larger width for amount display)
      1: const pw.FlexColumnWidth(4),
    },
    children: [
      pw.TableRow(
        children:
            [
              // Total label in Arabic (المجموع = Total)
              pw.Padding(
                padding: pw.EdgeInsets.all(kNormalPadding),
                child: pw.Text(
                  'المجموع', // Total
                  style: pw.TextStyle(
                    font: font,
                    fontSize: 15,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              // Total amount with currency symbol
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
            ].reversed.toList(), // Reverse for RTL layout
        // Grey background to highlight the total row
        decoration: const pw.BoxDecoration(color: PdfColors.grey300),
      ),
    ],
  ),
);
