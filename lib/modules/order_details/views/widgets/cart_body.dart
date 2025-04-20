part of '../one_order_view.dart';

class _CartBody extends StatelessWidget {
  const _CartBody({required this.cart});
  final List<CartDetail> cart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kNormalPadding),
      child: Column(
        spacing: kSpacingBetweenWidgetsHight,
        children: [
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
              3: FlexColumnWidth(3),
              4: FlexColumnWidth(1),
            },
            children: [_buildTableHeader()],
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(3),
                  4: FlexColumnWidth(1),
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

TableRow _buildTableHeader() {
  final language = Language.current;
  return TableRow(
    children: [
      Padding(
        padding: EdgeInsets.all(kNormalPadding),
        child: Text(
          language.quantity,
          style: TextStyles.ts10B.copyWith(color: Colors.black),
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(kNormalPadding),
        child: Text(
          language.unit,
          style: TextStyles.ts10B.copyWith(color: Colors.black),
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(kNormalPadding),
        child: Text(
          language.product_code,
          style: TextStyles.ts10B.copyWith(color: Colors.black),
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(kNormalPadding),
        child: Text(
          language.product_name,
          style: TextStyles.ts10B.copyWith(color: Colors.black),
          textAlign: TextAlign.start,
          maxLines: 1,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(kNormalPadding),
        child: Text(
          language.price,
          style: TextStyles.ts10B.copyWith(color: Colors.black),
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      ),
    ],
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(kNormalRadius),
      color: ColorManger.myGold,
    ),
  );
}

List<TableRow> _buildTableRow(List<CartDetail> cart) {
  return List.generate(cart.length, (index) {
    return TableRow(
      children: [
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
          child: Text(cart[index].sku, textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(cart[index].productAr.nullToString),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            _converQuantity(cart[index].price.nullToString),
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
