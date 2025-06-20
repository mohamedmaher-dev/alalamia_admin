part of '../orders_view.dart';

/// Search results display widget for filtered orders
/// Shows search results in a scrollable list when search is active
/// Provides different UI states based on search results (enabled, empty, disabled)
class _OrdersSearchBody extends StatelessWidget {
  const _OrdersSearchBody();

  @override
  Widget build(final BuildContext context) {
    final language = Language.of(context);
    return Expanded(
      child: BlocBuilder<OrdersSearchCubit, OrdersSearchState>(
        builder:
            (final context, final state) => state.when(
              // Hidden state when search is not active
              disabled: () => const SizedBox.shrink(),
              // Display search results when orders are found
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
              // Show empty state when search yields no results
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
