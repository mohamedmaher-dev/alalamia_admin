part of '../orders_view.dart';

class OrdersTabBody extends StatelessWidget {
  const OrdersTabBody({
    super.key,
    required this.ordersCount,
    this.isLoading = false,
  });
  final int ordersCount;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    final language = Language.of(context);
    final cubit = context.read<OrdersTabCubit>();
    TextStyle? buildTextStyle(int index) {
      return index == cubit.state.index
          ? TextStyle(color: ColorManger.black)
          : null;
    }

    return BlocBuilder<OrdersTabCubit, OrdersTabState>(
      builder: (context, state) {
        return Skeletonizer(
          enabled: isLoading,
          child: Badge.count(
            count: state.index == 0 ? ordersCount : 0,
            alignment:
                state.index == 0
                    ? AlignmentDirectional.topStart
                    : AlignmentDirectional.topEnd,
            child: CupertinoSlidingSegmentedControl(
              thumbColor: ColorManger.myGold,
              children: {
                0: Text(language.orders, style: buildTextStyle(0)),
                1: Text(language.extirnal_orders, style: buildTextStyle(1)),
              },
              onValueChanged: (value) => cubit.changeTab(value!),
              groupValue: state.index,
            ),
          ),
        );
      },
    );
  }
}
