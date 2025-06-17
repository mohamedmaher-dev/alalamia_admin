part of '../invoice_view.dart';

/// PDF invoice table header widget displaying column titles for product information
/// Creates a structured table header with product details columns
/// Supports Arabic RTL layout with proper column sizing for PDF table format
Widget _invoiceTableHeader({required final Font font}) => pw.Container(
  margin: const pw.EdgeInsets.only(bottom: 10),
  alignment: pw.Alignment.center,
  child: pw.Table(
    columnWidths: {
      // Standard width columns for basic product info
      0: const pw.FlexColumnWidth(), // Product Name
      1: const pw.FlexColumnWidth(), // Product Code
      2: const pw.FlexColumnWidth(), // Quantity
      3: const pw.FlexColumnWidth(), // Unit
      // Wider column for price information
      4: const pw.FlexColumnWidth(2), // Price
    },
    children: [
      pw.TableRow(
        children:
            [
              // Product Name column header
              pw.Padding(
                padding: pw.EdgeInsets.all(kNormalPadding),
                child: pw.Text(
                  'اسم المنتج', // Product Name
                  style: pw.TextStyle(
                    font: font,
                    fontSize: 15,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              // Product Code column header
              pw.Padding(
                padding: pw.EdgeInsets.all(kNormalPadding),
                child: pw.Text(
                  'رقم الصنف', // Product Code
                  style: pw.TextStyle(
                    font: font,
                    fontSize: 15,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              // Quantity column header
              pw.Padding(
                padding: pw.EdgeInsets.all(kNormalPadding),
                child: pw.Text(
                  'الكمية', // Quantity
                  style: pw.TextStyle(
                    font: font,
                    fontSize: 15,
                    fontWeight: pw.FontWeight.bold,
                  ),
                  textAlign: pw.TextAlign.center,
                ),
              ),
              // Unit column header
              pw.Padding(
                padding: pw.EdgeInsets.all(kNormalPadding),
                child: pw.Text(
                  'الوحدة', // Unit
                  style: pw.TextStyle(
                    font: font,
                    fontSize: 15,
                    fontWeight: pw.FontWeight.bold,
                  ),
                  textAlign: pw.TextAlign.center,
                ),
              ),
              // Price column header
              pw.Padding(
                padding: pw.EdgeInsets.all(kNormalPadding),
                child: pw.Text(
                  'السعر', // Price
                  style: pw.TextStyle(
                    font: font,
                    fontSize: 15,
                    fontWeight: pw.FontWeight.bold,
                  ),
                  textAlign: pw.TextAlign.center,
                ),
              ),
            ].reversed.toList(), // Reverse for RTL layout
        // Grey background to distinguish header from data rows
        decoration: const pw.BoxDecoration(color: PdfColors.grey300),
      ),
    ],
  ),
);
