import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:alalamia_admin/core/utils/assets_manger.dart';
import 'package:alalamia_admin/modules/order_details/data/models/orders_details_response_model/orders_details_response_model.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:jiffy/jiffy.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:typed_data';
import 'package:pdf/widgets.dart';

// Import widget parts for modular PDF invoice components
part 'widgets/invoice_title.dart';
part 'widgets/invoice_info.dart';
part 'widgets/invoice_table_header.dart';
part 'widgets/invoice_table_content.dart';
part 'widgets/invoice_summary.dart';

/// Main function for creating styled PDF invoices from order data
/// Generates a professional invoice document with Arabic RTL support
/// Includes order details, customer information, items table, and pricing summary
///
/// [order] - Complete order details including items, customer info, and pricing
/// [orderArgs] - Basic order data including country info and phone number
/// Returns PDF document as byte array for saving or sharing
Future<Uint8List> createStyledInvoice(
  final OrdersDetailsResponseModel order,
  final OrdersDatum orderArgs,
) async {
  // Load Arabic font for proper RTL text rendering
  final fontData = await rootBundle.load(AssetsManger.fontsAlmaraiRegular);
  final font = pw.Font.ttf(fontData);

  // Create new PDF document
  final pdf = pw.Document();

  // Add single page with multi-page support for long invoices
  pdf.addPage(
    pw.MultiPage(
      // Right-to-left text direction for Arabic support
      textDirection: pw.TextDirection.rtl,
      // Standard A4 page format
      pageFormat: PdfPageFormat.a4,
      // Consistent margins around content
      margin: const pw.EdgeInsets.all(32),
      build:
          (final context) => [
            // Invoice header with company branding and title
            _invoiceTitle(font: font),
            pw.SizedBox(height: kSpacingBetweenWidgetsHight),
            pw.Divider(thickness: 1),

            // Customer and order information section
            pw.SizedBox(height: kSpacingBetweenWidgetsHight),
            _invoiceInfo(font: font, order: order, userPhone: orderArgs.phone),

            // Table header for order items
            pw.SizedBox(height: kSpacingBetweenWidgetsHight),
            _invoiceTableHeader(font: font),

            // Order items table with product details and pricing
            _invoiceTableContent(font: font, order: order),

            // Pricing summary with totals and currency
            pw.SizedBox(height: kSpacingBetweenWidgetsHight),
            _invoiceSummary(
              font: font,
              order: order,
              currency: orderArgs.countryModel.currency,
            ),
            pw.Divider(thickness: 1),
          ],
    ),
  );

  // Convert PDF document to byte array for file operations
  return await pdf.save();
}
