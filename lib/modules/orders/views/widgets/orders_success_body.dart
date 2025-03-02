part of '../orders_view.dart';

class _OrdersSuccessBody extends StatelessWidget {
  const _OrdersSuccessBody({
    this.items = fakeOrderResponse,
    this.isLoading = false,
  });
  final bool isLoading;
  final List<OrderItem> items;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kNormalPadding),
      child: Column(
        children: [
          OrdersTabBody(ordersCount: items.length, isLoading: isLoading),
          SizedBox(height: kSpacingBetweenWidgetsHight),
          Expanded(
            child: ListView.builder(
              physics: isLoading ? const NeverScrollableScrollPhysics() : null,
              itemBuilder:
                  (context, index) => _OrderItemBody(
                    index: index,
                    model: items[index],
                    isLoading: isLoading,
                  ),
              itemCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}
