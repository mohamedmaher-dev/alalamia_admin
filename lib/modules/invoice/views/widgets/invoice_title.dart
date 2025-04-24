part of '../invoice_view.dart';

Widget _invoiceTitle({required Font font}) => pw.Column(
  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
  mainAxisAlignment: pw.MainAxisAlignment.center,
  children: [
    pw.Text('فاتورة', style: pw.TextStyle(font: font, fontSize: 25)),
    pw.Text(
      'العالمية للبهارات و العسل اليمني',
      style: pw.TextStyle(font: font, fontSize: 15),
    ),
  ],
);
