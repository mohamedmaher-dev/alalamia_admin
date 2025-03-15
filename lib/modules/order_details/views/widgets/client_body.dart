part of '../one_order_view.dart';

class _ClientBody extends StatelessWidget {
  const _ClientBody({required this.order, required this.args});
  final OrdersDetailsResponseModel order;
  final OrdersDatum args;

  @override
  Widget build(BuildContext context) {
    final language = Language.of(context);
    return Column(
      children: [
        ListTile(
          leading: Icon(CupertinoIcons.person_circle_fill),
          title: Text(language.client_info, style: TextStyles.ts15B),
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: kNormalMargin),
          child: Column(
            children: [
              ListTile(
                leading: Icon(CupertinoIcons.phone),
                title: Text(args.phone),
                subtitle: Text(language.client_number),
                trailing: IconButton(
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: args.phone));
                  },
                  icon: Icon(Icons.copy),
                ),
              ),
              Divider(),
              _OrderStateSteps(
                orderStatus: args.status,
                orderId: args.id.toString(),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: kNormalPadding),
                child: Text(
                  language.click_to_change_status,
                  style: TextStyles.ts10B.copyWith(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
