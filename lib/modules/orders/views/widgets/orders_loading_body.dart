part of '../orders_view.dart';

class _OrdersLoadingBody extends StatelessWidget {
  const _OrdersLoadingBody();
  final List<OrderItem> items = fakeOrderResponse;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _OrderItemBody(index: 0, model: items[0], isLoading: true),
        _OrderItemBody(index: 1, model: items[1], isLoading: true),
        _OrderItemBody(index: 2, model: items[2], isLoading: true),
      ],
    );
  }
}
