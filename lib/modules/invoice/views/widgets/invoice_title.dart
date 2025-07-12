part of '../invoice_view.dart';

/// PDF invoice title section widget displaying company branding and invoice header
/// Creates centered title layout with company name and invoice designation
/// Supports Arabic text rendering with proper font and sizing for PDF output
Widget _invoiceTitle({required final Font font}) => pw.Column(
  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
  mainAxisAlignment: pw.MainAxisAlignment.center,
  children: [
    // Main invoice title in Arabic (فاتورة = Invoice)
    pw.Text('فاتورة', style: pw.TextStyle(font: font, fontSize: 25)),
    // Company name in Arabic (Alalamia for Spices and Yemeni Honey)
    pw.Text(
      'العالمية للبهارات و العسل اليمني',
      style: pw.TextStyle(font: font, fontSize: 15),
    ),
  ],
);
