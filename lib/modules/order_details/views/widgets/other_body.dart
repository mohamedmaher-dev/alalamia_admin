part of '../one_order_view.dart';

class _OtherBody extends StatelessWidget {
  const _OtherBody({required this.order, required this.args});
  final OrdersDetailsResponseModel order;
  final OrdersDatum args;
  @override
  Widget build(BuildContext context) {
    final language = Language.of(context);
    return Column(
      children: [
        Divider(),
        ListTile(
          leading: Icon(Icons.more_rounded),
          title: Text(language.other_info, style: TextStyles.ts15B),
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: kNormalMargin),
          child: Column(
            children: [
              if (order.requestNo != null || order.requestNo!.isNotEmpty)
                ListTile(
                  leading: Icon(CupertinoIcons.money_dollar),
                  title: Text(args.paymentType.paymentTypeText),
                  subtitle: Text(language.payment_type),
                ),
              ListTile(
                leading: Icon(Icons.delivery_dining),
                title: Text(language.no_data),
                subtitle: Text(language.aramex_number),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
