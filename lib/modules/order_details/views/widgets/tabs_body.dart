part of '../one_order_view.dart';

class _TabsBody extends StatelessWidget {
  const _TabsBody();

  @override
  Widget build(BuildContext context) {
    final language = Language.of(context);
    TextStyle getTextStyle(OrderDetailsTabsModel currentTab, tab) {
      final activeTextStyle = TextStyles.ts10B.copyWith(color: Colors.black);
      final inactiveTextStyle = TextStyles.ts10B;
      return tab == currentTab ? activeTextStyle : inactiveTextStyle;
    }

    return BlocBuilder<OrderDetailsTabCubit, OrderDetailsTabState>(
      builder:
          (
            context,
            state,
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
            onValueChanged: (tab) {
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
