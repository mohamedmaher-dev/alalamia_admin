part of '../orders_view.dart';

class _OrdersTabBody extends StatelessWidget {
  const _OrdersTabBody();

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
        return CupertinoSlidingSegmentedControl(
          thumbColor: ColorManger.myGold,
          children: {
            0: Text(language.orders, style: buildTextStyle(0)),
            1: Text(language.extirnal_orders, style: buildTextStyle(1)),
          },
          onValueChanged: (value) => cubit.changeTab(value!),
          groupValue: state.index,
        );
      },
    );
  }
}
