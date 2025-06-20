part of '../one_order_view.dart';

/// Cart items section widget for order details screen
/// Displays all products in the order in a structured table format
/// Second tab in the order details interface showing product details, quantities, and prices
class _CartBody extends StatefulWidget {
  const _CartBody();

  @override
  State<_CartBody> createState() => _CartBodyState();
}

/// State class for cart body with local cart management
/// Allows hiding items from view without affecting original data
/// Provides context menu for item interactions
class _CartBodyState extends State<_CartBody> {
  /// Local copy of cart items for manipulation (hide functionality)
  late List<CartDetail> _localCart;

  @override
  void initState() {
    super.initState();
    // Create local copy of cart items from provider data
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

    // Show empty state if no cart items
    if (_localCart.isEmpty) {
      return EmptyView(icon: CupertinoIcons.cart, text: language.no_data);
    }

    return Padding(
      padding: EdgeInsets.all(kNormalPadding),
      child: Column(
        spacing: kSpacingBetweenWidgetsHight,
        children: [
          // Table header with column titles
          const _TableHeaderBody(),
          // Scrollable list of cart items with context menu
          Flexible(
            fit: FlexFit.tight,
            child: ListView.builder(
              itemCount: _localCart.length,
              itemBuilder: (final context, final index) {
                final item = _localCart[index];
                return CupertinoContextMenu(
                  actions: [
                    // Context menu action to hide items from view
                    CupertinoContextMenuAction(
                      trailingIcon: CupertinoIcons.eye_slash,
                      child: const Text('Hide'),
                      onPressed: () {
                        setState(() {
                          // Remove item from local view (doesn't affect original data)
                          _localCart.removeAt(index);
                          context.router.pop();
                        });
                      },
                    ),
                  ],
                  // Cart item row with golden border styling
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

/// Table header widget for cart items table
/// Displays column titles with golden background styling
/// Provides structure for product information display
class _TableHeaderBody extends StatelessWidget {
  const _TableHeaderBody();

  @override
  Widget build(final BuildContext context) {
    final language = Language.current;
    return Container(
      padding: EdgeInsets.all(kNormalPadding),
      decoration: BoxDecoration(
        // Golden background for header visibility
        color: ColorManger.myGold,
        borderRadius: BorderRadius.circular(kNormalRadius),
      ),
      // Build the table header row using TableHeaderCell for each column
      child: Row(
        children: [
          // Product name column (takes 3x width)
          TableHeaderCell(text: language.product_name, flex: 3),
          // Product code column
          TableHeaderCell(text: language.product_code),
          // Quantity column
          TableHeaderCell(text: language.quantity),
          // Unit type column
          TableHeaderCell(text: language.unit),
          // Price column
          TableHeaderCell(text: language.price),
        ],
      ),
    );
  }
}

/// Individual cart item row widget displaying product information
/// Renders product details in structured table cell format
/// Handles responsive width calculation for proper column alignment
class CartTableRow extends StatelessWidget {
  /// Cart item data to display in the row
  final CartDetail item;

  const CartTableRow({required this.item, super.key});

  @override
  Widget build(final BuildContext context) => LayoutBuilder(
    builder: (final context, final constraints) {
      // Calculate responsive column widths
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
          // Product name (3x width for longer text)
          CartTableCell(
            text: item.productAr.nullToString,
            width: unitWidth * 3,
          ),
          const GoldVerticalDivider(),
          // Product SKU/code
          CartTableCell(text: item.sku, width: unitWidth),
          const GoldVerticalDivider(),
          // Quantity with number formatting
          CartTableCell(
            text: _converQuantity(item.quantity.nullToString),
            width: unitWidth,
          ),
          const GoldVerticalDivider(),
          // Unit type (kg, pieces, etc.)
          CartTableCell(text: item.unit!.name.nullToString, width: unitWidth),
          const GoldVerticalDivider(),
          // Price with number formatting
          CartTableCell(
            text: _converQuantity(item.price.nullToString),
            width: unitWidth,
          ),
        ],
      );
    },
  );
}

/// Table header cell widget for column titles
/// Provides consistent styling and flexible width allocation
/// Used in table header row for professional appearance
class TableHeaderCell extends StatelessWidget {
  /// Header text to display
  final String text;

  /// Flex ratio for responsive width (default 1, product name uses 3)
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

/// Table data cell widget for cart item information
/// Handles fixed width sizing and center text alignment
/// Used for displaying product data in table rows
class CartTableCell extends StatelessWidget {
  /// Text content to display in the cell
  final String text;

  /// Fixed width for the cell to maintain table structure
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

/// Vertical divider widget with golden color for table column separation
/// Provides visual separation between table columns
/// Maintains consistent height with table rows
class GoldVerticalDivider extends StatelessWidget {
  const GoldVerticalDivider({super.key});

  @override
  Widget build(final BuildContext context) => const SizedBox(
    height: kToolbarHeight,
    child: VerticalDivider(width: 1, color: ColorManger.myGold),
  );
}

/// Utility function for converting and formatting quantity/price strings
/// Handles both integer and decimal number formatting
/// Removes unnecessary decimal places for cleaner display
///
/// [quantity] - String representation of number to format
/// Returns formatted string with proper number representation
String _converQuantity(final String quantity) {
  // Try parsing as integer first
  final int? asInt = int.tryParse(quantity);
  if (asInt != null) {
    return asInt.toString();
  } else {
    // Parse as double and format appropriately
    final double asDouble = double.parse(quantity);
    if (asDouble % 1 == 0) {
      // Remove decimal if it's a whole number
      return asDouble.toInt().toString();
    } else {
      // Keep decimal for fractional numbers
      return asDouble.toString();
    }
  }
}
