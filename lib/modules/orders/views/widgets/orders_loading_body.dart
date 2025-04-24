part of '../orders_view.dart';

class _OrdersLoadingBody extends StatelessWidget {
  const _OrdersLoadingBody();
  final OrdersDatum item = fakeOrdersResponseModel;
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    physics: const NeverScrollableScrollPhysics(),
    child: Column(
      children: List.generate(
        5,
        (index) => _OrderItemBody(index: index, model: item, isLoading: true),
      ),
    ),
  );
}
