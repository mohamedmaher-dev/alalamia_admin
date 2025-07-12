part of '../orders_view.dart';

/// Main pagination widget for orders list with infinite scroll
/// Handles loading states, error states, and seamless data fetching
/// Provides smooth infinite scroll experience with appropriate indicators
class _OrdersPaginationBody extends StatelessWidget {
  const _OrdersPaginationBody();

  @override
  Widget build(final BuildContext context) {
    final language = Language.of(context);
    final cubit = context.read<OrdersCubit>();
    return PagingListener(
      // Connect to orders pagination controller
      controller: cubit.pagingController,
      builder:
          (final context, final state, final fetchNextPage) => Expanded(
            child: PagedListView<int, OrdersDatum>(
              // Disable scrolling during initial loading to prevent issues
              physics:
                  state.isLoading && state.keys == null
                      ? const NeverScrollableScrollPhysics()
                      : null,
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate(
                // Show skeleton loading animation for first page
                firstPageProgressIndicatorBuilder:
                    (final context) => const _OrdersLoadingBody(),
                // Show error view if first page fails to load
                firstPageErrorIndicatorBuilder:
                    (final context) => const ErrorView(),
                // Show small loading indicator when loading next page
                newPageProgressIndicatorBuilder:
                    (final context) => Center(
                      child: CircularProgressIndicator(
                        padding: EdgeInsets.all(kNormalPadding),
                        strokeWidth: 1,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                // Show error message if loading next page fails
                newPageErrorIndicatorBuilder:
                    (final context) =>
                        Center(child: Text(language.something_went_wrong)),
                // Show empty state when no orders are found
                noItemsFoundIndicatorBuilder:
                    (final context) => EmptyView(
                      icon: Icons.list,
                      text: language.no_orders_found,
                    ),
                // Show message when all orders have been loaded
                noMoreItemsIndicatorBuilder:
                    (final context) =>
                        Center(child: Text(language.no_more_orders)),
                // Build individual order items in the list
                itemBuilder:
                    (final context, final item, final index) => _OrderItemBody(
                      index: index,
                      model: item,
                      isLoading: false,
                    ),
              ),
            ),
          ),
    );
  }
}
