part of '../one_order_view.dart';

class _GeneralBody extends StatelessWidget {
  const _GeneralBody();

  @override
  Widget build(final BuildContext context) {
    final args = Provider.of<OrdersDatum>(context);
    final orderDetails = Provider.of<OrdersDetailsResponseModel>(context);
    final language = Language.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(CupertinoIcons.person_circle_fill),
            title: Text(language.client_info),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: kNormalMargin),
            child: Column(
              children: [
                ListTile(
                  leading: UserAvatarBody(userName: args.userName),
                  title: Text(args.userName),
                  subtitle: Text(language.client_name),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(CupertinoIcons.phone),
                  title: Text(args.phone),
                  subtitle: Text(language.client_number),
                  trailing: IconButton(
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: args.phone));
                    },
                    icon: const Icon(Icons.copy),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.cube_box_fill),
            title: Text(language.order_summary),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: kNormalMargin),
            child: Column(
              children: [
                _OrderStateSteps(
                  orderStatus: args.status,
                  orderId: args.id.toString(),
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: const Icon(CupertinoIcons.number),
                        title: Text(args.requestNumber),
                        subtitle: Text(language.order_number),
                        onLongPress: () async {
                          await Clipboard.setData(
                            ClipboardData(text: args.requestNumber),
                          );
                          AppSnackBar.show(
                            msg: language.successfully_copied,
                            type: ContentType.success,
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: const Icon(CupertinoIcons.cube_box_fill),
                        title: Text(
                          '${orderDetails.cartDetail!.length} ${language.product}',
                        ),
                        subtitle: Text(language.number_of_products),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
