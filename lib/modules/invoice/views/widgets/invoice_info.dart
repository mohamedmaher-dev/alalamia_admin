part of '../invoice_view.dart';

Widget _invoiceInfo({
  required Font font,
  required OrdersDetailsResponseModel order,
  required String userPhone,
}) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      _invoiceInfoRow(
        font: font,
        value1: "اسم العميل : ${order.userName}",
        value2: 'رقم الهاتف : $userPhone',
      ),
      pw.Container(
        alignment: pw.Alignment.centerRight,
        height: 20,
        child: pw.Text(
          'العنوان : ${order.address!.name}',
          style: pw.TextStyle(font: font, fontSize: 15),
        ),
      ),
      pw.Container(
        alignment: pw.Alignment.centerRight,
        height: 20,
        child: pw.Text(
          "رقم الطلب : ${order.requestNo}",
          style: pw.TextStyle(font: font, fontSize: 15),
        ),
      ),
      pw.Container(
        alignment: pw.Alignment.centerRight,
        height: 20,
        child: pw.Text(
          'تاريخ الطلب : ${Jiffy.parse(order.createdAt!).yMMMEdjm}',
          style: pw.TextStyle(font: font, fontSize: 15),
        ),
      ),
    ],
  );
}

Widget _invoiceInfoRow({
  required Font font,
  required String value1,
  required String value2,
}) {
  return pw.Row(
    children: [
      pw.Expanded(
        child: pw.Container(
          alignment: pw.Alignment.centerRight,
          height: 20,
          child: pw.Text(value1, style: pw.TextStyle(font: font, fontSize: 15)),
        ),
      ),
      pw.Expanded(
        child: pw.Container(
          alignment: pw.Alignment.centerRight,
          height: 20,
          child: pw.Text(value2, style: pw.TextStyle(font: font, fontSize: 15)),
        ),
      ),
    ],
  );
}
