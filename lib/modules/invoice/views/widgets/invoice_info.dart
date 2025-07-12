part of '../invoice_view.dart';

/// PDF invoice information section widget displaying customer and order details
/// Creates customer info, phone, address, order number, and date section for PDF
/// Supports Arabic RTL text layout with proper font rendering
Widget _invoiceInfo({
  required final Font font,
  required final OrdersDetailsResponseModel order,
  required final String userPhone,
}) => pw.Column(
  crossAxisAlignment: pw.CrossAxisAlignment.start,
  children: [
    // Customer name and phone number in two-column layout
    _invoiceInfoRow(
      font: font,
      value1: 'اسم العميل : ${order.userName}', // Customer Name
      value2: 'رقم الهاتف : $userPhone', // Phone Number
    ),
    // Customer delivery address
    pw.Container(
      alignment: pw.Alignment.centerRight,
      height: 20,
      child: pw.Text(
        'العنوان : ${order.address == null ? 'لا يوجد' : order.address!.name}', // Address
        style: pw.TextStyle(font: font, fontSize: 15),
      ),
    ),
    // Order number for tracking
    pw.Container(
      alignment: pw.Alignment.centerRight,
      height: 20,
      child: pw.Text(
        'رقم الطلب : ${order.requestNo}', // Order Number
        style: pw.TextStyle(font: font, fontSize: 15),
      ),
    ),
    // Order creation date formatted for display
    pw.Container(
      alignment: pw.Alignment.centerRight,
      height: 20,
      child: pw.Text(
        'تاريخ الطلب : ${Jiffy.parse(order.createdAt!).yMMMEdjm}', // Order Date
        style: pw.TextStyle(font: font, fontSize: 15),
      ),
    ),
  ],
);

/// PDF invoice information row widget for two-column data display
/// Creates side-by-side layout for related information pairs
/// Maintains consistent spacing and alignment for professional appearance
Widget _invoiceInfoRow({
  required final Font font,
  required final String value1,
  required final String value2,
}) => pw.Row(
  children: [
    // Left column for first piece of information
    pw.Expanded(
      child: pw.Container(
        alignment: pw.Alignment.centerRight,
        height: 20,
        child: pw.Text(value1, style: pw.TextStyle(font: font, fontSize: 15)),
      ),
    ),
    // Right column for second piece of information
    pw.Expanded(
      child: pw.Container(
        alignment: pw.Alignment.centerRight,
        height: 20,
        child: pw.Text(value2, style: pw.TextStyle(font: font, fontSize: 15)),
      ),
    ),
  ],
);
