part of '../orders_view.dart';

class _OrderSearchForm extends StatelessWidget {
  const _OrderSearchForm();

  @override
  Widget build(final BuildContext context) {
    final cubit = context.read<OrdersCubit>();
    final cubitSearch = context.read<OrdersSearchCubit>();
    final language = Language.of(context);
    return Padding(
      padding: EdgeInsets.all(kNormalPadding),
      child: SizedBox(
        height: 25.h,
        child: PagingListener(
          controller: cubit.pagingController,
          builder:
              (final context, final state, final fetchNextPage) =>
                  TextFormField(
                    enabled: cubit.pagingController.items != null,
                    controller: cubitSearch.searchController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kNormalRadius),
                        borderSide: BorderSide.none,
                      ),
                      isDense: true,
                      hintText: language.search_here,
                      filled: true,
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon:
                          cubitSearch.searchController.text.isNotEmpty
                              ? IconButton(
                                onPressed: () {
                                  cubitSearch.clearSearch();
                                  FocusScope.of(context).unfocus();
                                },
                                icon: const Icon(Icons.clear),
                              )
                              : null,
                    ),
                    onChanged:
                        (final value) =>
                            cubitSearch.setSearch(value, state.items!),
                  ),
        ),
      ),
    );
  }
}
