part of '../orders_view.dart';

class _OrdersSearchBody extends StatelessWidget {
  const _OrdersSearchBody();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<OrdersSearchCubit, OrdersSearchState>(
        builder: (context, state) {
          return state.when(
            disabled: () => SizedBox.shrink(),
            enabled:
                (orders) => ListView.builder(
                  itemCount: orders.length,
                  itemBuilder:
                      (context, index) => _OrderItemBody(
                        index: index,
                        model: orders[index],
                        isLoading: false,
                      ),
                ),
            empty:
                () =>
                    const EmptyView(icon: Icons.list, text: 'No orders found'),
          );
        },
      ),
    );
  }
}
