part of '../orders_view.dart';

class _OrdersPaginationBody extends StatelessWidget {
  const _OrdersPaginationBody();
  @override
  Widget build(final BuildContext context) {
    final language = Language.of(context);
    final cubit = context.read<OrdersCubit>();
    return PagingListener(
      controller: cubit.pagingController,
      builder:
          (final context, final state, final fetchNextPage) => Expanded(
            child: PagedListView<int, OrdersDatum>(
              physics:
                  state.isLoading && state.keys == null
                      ? const NeverScrollableScrollPhysics()
                      : null,
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate(
                firstPageProgressIndicatorBuilder:
                    (final context) => const _OrdersLoadingBody(),
                firstPageErrorIndicatorBuilder:
                    (final context) => const ErrorView(),
                newPageProgressIndicatorBuilder:
                    (final context) => Center(
                      child: CircularProgressIndicator(
                        padding: EdgeInsets.all(kNormalPadding),
                        strokeWidth: 1,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                newPageErrorIndicatorBuilder:
                    (final context) =>
                        Center(child: Text(language.something_went_wrong)),
                noItemsFoundIndicatorBuilder:
                    (final context) => EmptyView(
                      icon: Icons.list,
                      text: language.no_orders_found,
                    ),
                noMoreItemsIndicatorBuilder:
                    (final context) =>
                        Center(child: Text(language.no_more_orders)),
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
