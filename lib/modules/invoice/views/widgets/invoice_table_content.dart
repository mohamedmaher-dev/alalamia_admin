part of '../invoice_view.dart';

/// PDF invoice table content widget displaying all product items in order
/// Creates data rows with product information including name, code, quantity, unit, and price
/// Supports alternating row colors for better readability and Arabic RTL layout
Widget _invoiceTableContent({
  required final Font font,
  required final OrdersDetailsResponseModel order,
}) => pw.Table(
  columnWidths: {
    // Column width configuration matching header layout
    0: const pw.FlexColumnWidth(), // Product Name
    1: const pw.FlexColumnWidth(), // Product Code
    2: const pw.FlexColumnWidth(), // Quantity
    3: const pw.FlexColumnWidth(), // Unit
    4: const pw.FlexColumnWidth(2), // Price (wider column)
  },
  // Generate table rows for each cart item
  children: List.generate(
    order.cartDetail!.length,
    (final index) => pw.TableRow(
      // Alternating row background for better readability
      decoration: index % 2 == 0
          ? const pw.BoxDecoration(color: PdfColors.grey100)
          : null,
      children: [
        // Product name in Arabic
        pw.Padding(
          padding: pw.EdgeInsets.all(kNormalPadding),
          child: pw.Text(
            order.cartDetail![index].productAr!,
            style: pw.TextStyle(font: font, fontSize: 12),
          ),
        ),
        // Product SKU/code
        pw.Padding(
          padding: pw.EdgeInsets.all(kNormalPadding),
          child: pw.Text(
            order.cartDetail![index].sku.toString(),
            style: pw.TextStyle(font: font, fontSize: 12),
            textAlign: pw.TextAlign.center,
          ),
        ),
        // Product quantity
        pw.Padding(
          padding: pw.EdgeInsets.all(kNormalPadding),
          child: pw.Text(
            order.cartDetail![index].quantity!,
            style: pw.TextStyle(font: font, fontSize: 12),
            textAlign: pw.TextAlign.center,
          ),
        ),
        // Unit type (kg, pieces, etc.)
        pw.Padding(
          padding: pw.EdgeInsets.all(kNormalPadding),
          child: pw.Text(
            order.cartDetail![index].unit == null
                ? Language.current.no_data
                : order.cartDetail![index].unit!.name!,
            style: pw.TextStyle(font: font, fontSize: 12),
            textAlign: pw.TextAlign.center,
          ),
        ),
        // Product price
        pw.Padding(
          padding: pw.EdgeInsets.all(kNormalPadding),
          child: pw.Text(
            order.cartDetail![index].price!,
            style: pw.TextStyle(font: font, fontSize: 12),
            textAlign: pw.TextAlign.center,
          ),
        ),
      ].reversed.toList(), // Reverse for RTL layout
    ),
  ),
  // Dashed border around entire table for professional appearance
  border: TableBorder.all(style: pw.BorderStyle.dashed),
);
