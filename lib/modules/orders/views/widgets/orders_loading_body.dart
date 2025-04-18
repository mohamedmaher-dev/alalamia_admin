part of '../orders_view.dart';

class _OrdersLoadingBody extends StatelessWidget {
  const _OrdersLoadingBody();
  final List<OrdersDatum> items = fakeOrdersResponseModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          _OrderItemBody(index: 0, model: items[0], isLoading: true),
          _OrderItemBody(index: 1, model: items[0], isLoading: true),
          _OrderItemBody(index: 2, model: items[0], isLoading: true),
          _OrderItemBody(index: 3, model: items[0], isLoading: true),
        ],
      ),
    );
  }
}
