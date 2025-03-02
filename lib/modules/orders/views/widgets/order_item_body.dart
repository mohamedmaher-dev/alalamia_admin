part of '../orders_view.dart';

class _OrderItemBody extends StatelessWidget {
  const _OrderItemBody({
    required this.index,
    required this.model,
    required this.isLoading,
  });
  final OrderItem model;
  final int index;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final language = Language.of(context);
    return GestureDetector(
      onTap: () => AppRouter.push(AppPages.oneOrder, extra: model),
      child: Skeletonizer(
        enabled: isLoading,
        child: Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(CupertinoIcons.person),
                title: Text(model.cart.user.name, style: TextStyles.tsP12B),
                subtitle: Text(language.client_name),
                trailing: Icon(CupertinoIcons.right_chevron),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.phone),
                title: Text(model.cart.user.phone, style: TextStyles.tsP12B),
                subtitle: Text(language.client_number),
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: Icon(CupertinoIcons.number),
                      title: Text(
                        model.requestNumber,
                        style: TextStyles.tsP12B,
                      ),
                      subtitle: Text(language.order_number),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      leading: Icon(CupertinoIcons.cart),
                      title: Text(
                        '${model.cart.items.length} ${language.product}',
                        style: TextStyles.tsP12B,
                      ),
                      subtitle: Text(language.count_of_products),
                    ),
                  ),
                ],
              ),
              Divider(),
              ListTile(
                leading: Icon(CupertinoIcons.calendar),
                title: Text(
                  Jiffy.parse(model.orderDate).yMMMMEEEEdjm,
                  style: TextStyles.tsP12B,
                ),
                subtitle: Text(language.order_date),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
