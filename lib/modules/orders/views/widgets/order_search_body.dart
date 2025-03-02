part of '../orders_view.dart';

class _OrderSearchBody extends StatelessWidget {
  const _OrderSearchBody();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrdersCubit>();
    final language = Language.of(context);
    return Padding(
      padding: EdgeInsets.all(kNormalPadding),
      child: SizedBox(
        child: BlocBuilder<OrdersCubit, OrdersState>(
          builder: (context, state) {
            return TextFormField(
              enabled: state is! OrdersStateLoading,
              controller: cubit.searchController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kNormalRadius),
                  borderSide: BorderSide.none,
                ),
                isDense: true,
                hintText: language.search_here,
                filled: true,
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) => cubit.search(value),
            );
          },
        ),
      ),
    );
  }
}
