part of '../orders_view.dart';

class _OrdersPaginationBody extends StatelessWidget {
  const _OrdersPaginationBody();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrdersCubit>();
    return PagingListener(
      controller: cubit.pagingController,
      builder:
          (context, state, fetchNextPage) => Expanded(
            child: PagedListView<int, OrderItem>(
              physics:
                  state.isLoading && state.keys == null
                      ? NeverScrollableScrollPhysics()
                      : null,
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate(
                firstPageProgressIndicatorBuilder:
                    (context) => _OrdersLoadingBody(),
                firstPageErrorIndicatorBuilder: (context) => ErrorView(),
                newPageProgressIndicatorBuilder:
                    (context) => Center(
                      child: CircularProgressIndicator(
                        padding: EdgeInsets.all(kNormalPadding),
                        strokeWidth: 1,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                newPageErrorIndicatorBuilder:
                    (context) => Center(child: Text("Something went wrong")),
                noItemsFoundIndicatorBuilder:
                    (context) =>
                        EmptyView(icon: Icons.list, text: 'No orders found'),
                noMoreItemsIndicatorBuilder:
                    (context) => Center(child: Text('No more orders')),
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
