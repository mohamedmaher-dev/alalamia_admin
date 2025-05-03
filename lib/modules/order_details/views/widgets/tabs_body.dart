part of '../one_order_view.dart';

class _TabsBody extends StatelessWidget {
  const _TabsBody();

  @override
  Widget build(final BuildContext context) {
    final language = Language.of(context);
    TextStyle? getTextStyle(final OrderDetailsTabsModel currentTab, final tab) {
      final activeTextStyle = const TextStyle(color: Colors.black);
      return tab == currentTab ? activeTextStyle : null;
    }

    return BlocBuilder<OrderDetailsTabCubit, OrderDetailsTabState>(
      builder:
          (
            final context,
            final state,
          ) => CupertinoSlidingSegmentedControl<OrderDetailsTabsModel>(
            thumbColor: ColorManger.myGold,
            children: {
              OrderDetailsTabsModel.general: Text(
                language.general,
                style: getTextStyle(state.tab, OrderDetailsTabsModel.general),
              ),
              OrderDetailsTabsModel.cart: Text(
                language.cart,
                style: getTextStyle(state.tab, OrderDetailsTabsModel.cart),
              ),
              OrderDetailsTabsModel.address: Text(
                language.address,
                style: getTextStyle(state.tab, OrderDetailsTabsModel.address),
              ),
              OrderDetailsTabsModel.other: Text(
                language.other,
                style: getTextStyle(state.tab, OrderDetailsTabsModel.other),
              ),
            },
            groupValue: state.tab,
            onValueChanged: (final tab) {
              context.read<OrderDetailsTabCubit>().changeTab(tab!);
            },
          ),
    );
  }
}

enum OrderDetailsTabsModel {
  general,
  cart,
  address,
  other;

  static OrderDetailsTabsModel get defaultTab => OrderDetailsTabsModel.general;
}
