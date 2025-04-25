part of '../orders_view.dart';

class _OrdersSearchBody extends StatelessWidget {
  const _OrdersSearchBody();

  @override
  Widget build(final BuildContext context) {
    final language = Language.of(context);
    return Expanded(
      child: BlocBuilder<OrdersSearchCubit, OrdersSearchState>(
        builder:
            (final context, final state) => state.when(
              disabled: () => const SizedBox.shrink(),
              enabled:
                  (final orders) => ListView.builder(
                    itemCount: orders.length,
                    itemBuilder:
                        (final context, final index) => _OrderItemBody(
                          index: index,
                          model: orders[index],
                          isLoading: false,
                        ),
                  ),
              empty:
                  () => EmptyView(
                    icon: Icons.list,
                    text: language.no_orders_found,
                  ),
            ),
      ),
    );
  }
}
