part of '../invoice_view.dart';

Widget _invoiceInfo({required Font font, required OrderItem orderIem}) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      _invoiceInfoRow(
        font: font,
        value1: "اسم العميل : ${orderIem.cart.user.name}",
        value2: 'رقم الهاتف : ${orderIem.cart.user.phone}',
      ),
      pw.Container(
        alignment: pw.Alignment.centerRight,
        height: 20,
        child: pw.Text(
          'العنوان : ${orderIem.address == null ? 'لا يوجد بيانات' : orderIem.address!.addressName}',
          style: pw.TextStyle(font: font, fontSize: 15),
        ),
      ),
      pw.Container(
        alignment: pw.Alignment.centerRight,
        height: 20,
        child: pw.Text(
          "رقم الطلب : ${orderIem.requestNumber}",
          style: pw.TextStyle(font: font, fontSize: 15),
        ),
      ),
      pw.Container(
        alignment: pw.Alignment.centerRight,
        height: 20,
        child: pw.Text(
          'تاريخ الطلب : ${Jiffy.parse(orderIem.orderDate).yMMMEdjm}',
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
