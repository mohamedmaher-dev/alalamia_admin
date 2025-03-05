part of '../one_order_view.dart';

class _TableBody extends StatelessWidget {
  const _TableBody({required this.order});
  final OrderItem order;
  @override
  Widget build(BuildContext context) {
    final language = Language.of(context);
    final TextStyle headerStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: ColorManger.black,
    );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          spacing: kSpacingBetweenWidgetsHight,
          children: [
            ListTile(
              leading: const Icon(CupertinoIcons.cart),
              title: Text(language.the_cart),
            ),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(1),
              },
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(kNormalPadding),
                      child: Text(
                        'الكمية',
                        style: headerStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(kNormalPadding),
                      child: Text(
                        'اسم المنتج',
                        style: headerStyle,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(kNormalPadding),
                      child: Text(
                        'السعر',
                        style: headerStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kNormalRadius),
                    color: ColorManger.myGold,
                  ),
                ),
              ],
            ),

            Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(1),
              },
              children: _buildTableRow(order: order),
              border: TableBorder.all(
                color: ColorManger.myGold,
                borderRadius: BorderRadius.circular(kNormalRadius),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<TableRow> _buildTableRow({required OrderItem order}) {
  return List.generate(order.cart.items.length, (index) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            _converQuantity(order.cart.items[index].pivot.quantity),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(order.cart.items[index].productName),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            _converQuantity(order.cart.items[index].itemPrice),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  });
}

String _converQuantity(String quantity) {
  int? asInt = int.tryParse(quantity);
  if (asInt != null) {
    return asInt.toString();
  } else {
    double asDouble = double.parse(quantity);
    if (asDouble % 1 == 0) {
      return asDouble.toInt().toString();
    } else {
      return asDouble.toString();
    }
  }
}
