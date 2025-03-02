part of '../invoice_view.dart';

Widget _invoiceSummary({required Font font, required OrderItem order}) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text(
        'اجمالي المبلغ : ${order.cart.priceSum} ${order.cart.user.wallet.currencyName}',
        style: pw.TextStyle(font: font, fontSize: 15),
      ),
    ],
  );
}
