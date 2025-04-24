part of '../orders_view.dart';

class _OrdersPaginationBody extends StatelessWidget {
  const _OrdersPaginationBody();
  @override
  Widget build(BuildContext context) {
    final language = Language.of(context);
    final cubit = context.read<OrdersCubit>();
    return PagingListener(
      controller: cubit.pagingController,
      builder:
          (context, state, fetchNextPage) => Expanded(
            child: PagedListView<int, OrdersDatum>(
              physics:
                  state.isLoading && state.keys == null
                      ? const NeverScrollableScrollPhysics()
                      : null,
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate(
                firstPageProgressIndicatorBuilder:
                    (context) => const _OrdersLoadingBody(),
                firstPageErrorIndicatorBuilder: (context) => const ErrorView(),
                newPageProgressIndicatorBuilder:
                    (context) => Center(
                      child: CircularProgressIndicator(
                        padding: EdgeInsets.all(kNormalPadding),
                        strokeWidth: 1,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                newPageErrorIndicatorBuilder:
                    (context) =>
                        Center(child: Text(language.something_went_wrong)),
                noItemsFoundIndicatorBuilder:
                    (context) => EmptyView(
                      icon: Icons.list,
                      text: language.no_orders_found,
                    ),
                noMoreItemsIndicatorBuilder:
                    (context) => Center(child: Text(language.no_more_orders)),
                itemBuilder:
                    (context, item, index) => _OrderItemBody(
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
