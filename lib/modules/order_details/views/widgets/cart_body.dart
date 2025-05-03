part of '../one_order_view.dart';

class _CartBody extends StatelessWidget {
  const _CartBody();

  @override
  Widget build(final BuildContext context) {
    final cart = Provider.of<OrdersDetailsResponseModel>(context).cartDetail!;

    return Padding(
      padding: EdgeInsets.all(kNormalPadding),
      child: Column(
        spacing: kSpacingBetweenWidgetsHight,
        children: [
          const _TableHeaderBody(),
          Expanded(
            child: SingleChildScrollView(
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(),
                  3: FlexColumnWidth(),
                  4: FlexColumnWidth(),
                },
                children: _buildTableRow(cart),
                border: TableBorder.all(
                  color: ColorManger.myGold,
                  borderRadius: BorderRadius.circular(kNormalRadius),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TableHeaderBody extends StatelessWidget {
  const _TableHeaderBody();

  @override
  Widget build(final BuildContext context) {
    final textStyle = const TextStyle(color: Colors.black);
    final language = Language.current;
    return Container(
      padding: EdgeInsets.all(kNormalPadding),
      decoration: BoxDecoration(
        color: ColorManger.myGold,
        borderRadius: BorderRadius.circular(kNormalRadius),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              language.product_name,
              style: textStyle,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
          Expanded(
            child: Text(
              language.product_code,
              style: textStyle,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
          Expanded(
            child: Text(
              language.quantity,
              style: textStyle,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
          Expanded(
            child: Text(
              language.unit,
              style: textStyle,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
          Expanded(
            child: Text(
              language.price,
              style: textStyle,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}

List<TableRow> _buildTableRow(final List<CartDetail> cart) => List.generate(
  cart.length,
  (final index) => TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          cart[index].productAr.nullToString,
          textAlign: TextAlign.center,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Text(cart[index].sku, textAlign: TextAlign.center),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          _converQuantity(cart[index].quantity.nullToString),
          textAlign: TextAlign.center,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          cart[index].unit!.name.nullToString,
          textAlign: TextAlign.center,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          _converQuantity(cart[index].price.nullToString),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  ),
);

String _converQuantity(final String quantity) {
  final int? asInt = int.tryParse(quantity);
  if (asInt != null) {
    return asInt.toString();
  } else {
    final double asDouble = double.parse(quantity);
    if (asDouble % 1 == 0) {
      return asDouble.toInt().toString();
    } else {
      return asDouble.toString();
    }
  }
}
