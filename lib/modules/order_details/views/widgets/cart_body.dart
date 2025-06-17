part of '../one_order_view.dart';

class _CartBody extends StatefulWidget {
  const _CartBody();

  @override
  State<_CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<_CartBody> {
  late List<CartDetail> _localCart;

  @override
  void initState() {
    super.initState();
    final cart =
        Provider.of<OrdersDetailsResponseModel>(
          context,
          listen: false,
        ).cartDetail!;
    _localCart = List<CartDetail>.from(cart);
  }

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final language = Language.of(context);
    if (_localCart.isEmpty) {
      return EmptyView(icon: CupertinoIcons.cart, text: language.no_data);
    }
    return Padding(
      padding: EdgeInsets.all(kNormalPadding),
      child: Column(
        spacing: kSpacingBetweenWidgetsHight,
        children: [
          const _TableHeaderBody(),
          Flexible(
            fit: FlexFit.tight,
            child: ListView.builder(
              itemCount: _localCart.length,
              itemBuilder: (final context, final index) {
                final item = _localCart[index];
                return CupertinoContextMenu(
                  actions: [
                    CupertinoContextMenuAction(
                      trailingIcon: CupertinoIcons.eye_slash,
                      child: const Text('Hide'),
                      onPressed: () {
                        setState(() {
                          _localCart.removeAt(index);
                          context.router.pop();
                        });
                      },
                    ),
                  ],
                  child: Container(
                    height: kToolbarHeight,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      border: Border.all(color: ColorManger.myGold),
                      borderRadius: BorderRadius.circular(kNormalRadius),
                    ),
                    child: CartTableRow(item: item),
                  ),
                );
              },
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
    final language = Language.current;
    return Container(
      padding: EdgeInsets.all(kNormalPadding),
      decoration: BoxDecoration(
        color: ColorManger.myGold,
        borderRadius: BorderRadius.circular(kNormalRadius),
      ),
      // Build the table header row using TableHeaderCell for each column
      child: Row(
        children: [
          TableHeaderCell(text: language.product_name, flex: 3),
          TableHeaderCell(text: language.product_code),
          TableHeaderCell(text: language.quantity),
          TableHeaderCell(text: language.unit),
          TableHeaderCell(text: language.price),
        ],
      ),
    );
  }
}

class CartTableRow extends StatelessWidget {
  final CartDetail item;
  const CartTableRow({required this.item, super.key});

  @override
  Widget build(final BuildContext context) => LayoutBuilder(
    builder: (final context, final constraints) {
      final totalParts = 7;
      final dividerWidth = 1.0;
      final dividerCount = 4;
      final totalDividerSpace = dividerWidth * dividerCount;
      final availableWidth =
          constraints.maxWidth == double.infinity
              ? ScreenUtil().screenWidth
              : constraints.maxWidth - totalDividerSpace;
      final unitWidth = availableWidth / totalParts;
      return Row(
        children: [
          CartTableCell(
            text: item.productAr.nullToString,
            width: unitWidth * 3,
          ),
          const GoldVerticalDivider(),
          CartTableCell(text: item.sku, width: unitWidth),
          const GoldVerticalDivider(),
          CartTableCell(
            text: _converQuantity(item.quantity.nullToString),
            width: unitWidth,
          ),
          const GoldVerticalDivider(),
          CartTableCell(text: item.unit!.name.nullToString, width: unitWidth),
          const GoldVerticalDivider(),
          CartTableCell(
            text: _converQuantity(item.price.nullToString),
            width: unitWidth,
          ),
        ],
      );
    },
  );
}

class TableHeaderCell extends StatelessWidget {
  final String text;
  final int flex;
  const TableHeaderCell({required this.text, this.flex = 1, super.key});

  @override
  Widget build(final BuildContext context) => Flexible(
    fit: FlexFit.tight,
    flex: flex,
    child: Padding(
      padding: EdgeInsets.all(kNormalPadding),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
        maxLines: 1,
      ),
    ),
  );
}

class CartTableCell extends StatelessWidget {
  final String text;
  final double width;
  const CartTableCell({required this.text, required this.width, super.key});
  @override
  Widget build(final BuildContext context) => Padding(
    padding: EdgeInsets.all(kNormalPadding),
    child: SizedBox(
      width: width - kNormalPadding * 2,
      child: Text(text, textAlign: TextAlign.center),
    ),
  );
}

class GoldVerticalDivider extends StatelessWidget {
  const GoldVerticalDivider({super.key});

  @override
  Widget build(final BuildContext context) => const SizedBox(
    height: kToolbarHeight,
    child: VerticalDivider(width: 1, color: ColorManger.myGold),
  );
}

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
