part of '../orders_view.dart';

/// Search form widget for filtering orders in real-time
/// Provides instant search across order fields like customer name, phone, and order number
/// Integrates with orders pagination controller and search cubit for state management
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
        // Fixed height for consistent layout
        height: 25.h,
        child: PagingListener(
          // Listen to pagination controller for data availability
          controller: cubit.pagingController,
          builder:
              (final context, final state, final fetchNextPage) =>
                  TextFormField(
                    // Disable search until orders data is loaded
                    enabled: cubit.pagingController.items != null,
                    controller: cubitSearch.searchController,
                    decoration: InputDecoration(
                      // Compact padding for the search field
                      contentPadding: const EdgeInsets.all(0),
                      // Rounded border matching app design
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kNormalRadius),
                        borderSide: BorderSide.none,
                      ),
                      isDense: true,
                      hintText: language.search_here,
                      filled: true,
                      // Search icon for visual clarity
                      prefixIcon: const Icon(Icons.search),
                      // Clear button when text is present
                      suffixIcon:
                          cubitSearch.searchController.text.isNotEmpty
                              ? IconButton(
                                // Clear search and hide keyboard when pressed
                                onPressed: () {
                                  cubitSearch.clearSearch();
                                  FocusScope.of(context).unfocus();
                                },
                                icon: const Icon(Icons.clear),
                              )
                              : null,
                    ),
                    // Perform search as user types for instant results
                    onChanged:
                        (final value) =>
                            cubitSearch.setSearch(value, state.items!),
                  ),
        ),
      ),
    );
  }
}
