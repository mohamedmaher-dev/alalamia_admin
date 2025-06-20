part of '../one_order_view.dart';

/// Tab navigation widget for order details screen
/// Provides sliding segmented control for switching between General, Cart, and Other sections
/// Integrates with OrderDetailsTabCubit for state management
class _TabsBody extends StatelessWidget {
  const _TabsBody();

  @override
  Widget build(final BuildContext context) {
    final language = Language.of(context);

    /// Helper function to determine text style based on active tab
    /// [currentTab] - The currently selected tab
    /// [tab] - The tab to check for styling
    /// Returns black text for active tab, null (default) for inactive tabs
    TextStyle? getTextStyle(final OrderDetailsTabsModel currentTab, final tab) {
      final activeTextStyle = const TextStyle(color: Colors.black);
      return tab == currentTab ? activeTextStyle : null;
    }

    return BlocBuilder<OrderDetailsTabCubit, OrderDetailsTabState>(
      builder:
          (final context, final state) =>
              CupertinoSlidingSegmentedControl<OrderDetailsTabsModel>(
                // Gold thumb color matching app branding
                thumbColor: ColorManger.myGold,
                children: {
                  // General tab - customer info, order details, payment info
                  OrderDetailsTabsModel.general: Text(
                    language.general,
                    style: getTextStyle(
                      state.tab,
                      OrderDetailsTabsModel.general,
                    ),
                  ),
                  // Cart tab - order items, products, quantities, prices
                  OrderDetailsTabsModel.cart: Text(
                    language.cart,
                    style: getTextStyle(state.tab, OrderDetailsTabsModel.cart),
                  ),
                  // Other tab - additional information, order status tracking
                  OrderDetailsTabsModel.other: Text(
                    language.more,
                    style: getTextStyle(state.tab, OrderDetailsTabsModel.other),
                  ),
                },
                // Current selected tab
                groupValue: state.tab,
                // Handle tab change when user taps a different segment
                onValueChanged: (final tab) {
                  context.read<OrderDetailsTabCubit>().changeTab(tab!);
                },
              ),
    );
  }
}

/// Enum defining the different tab sections in order details
/// Used for tab navigation and organizing order information into logical sections
enum OrderDetailsTabsModel {
  /// General information tab - customer details, order summary, payment info
  general,

  /// Cart items tab - products, quantities, prices, and order composition
  cart,

  /// Other information tab - order status tracking, additional details
  other;

  /// Default tab to show when order details screen loads
  /// Returns General tab as the primary entry point
  static OrderDetailsTabsModel get defaultTab => OrderDetailsTabsModel.general;
}
