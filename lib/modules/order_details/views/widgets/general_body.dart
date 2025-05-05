part of '../one_order_view.dart';

class _GeneralBody extends StatelessWidget {
  const _GeneralBody();

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final args = Provider.of<OrdersDatum>(context);
    final orderDetails = Provider.of<OrdersDetailsResponseModel>(context);
    final language = Language.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(CupertinoIcons.person_circle_fill),
            title: Text(
              language.client_info,
              style: theme.textTheme.titleLarge,
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: kNormalMargin),
            child: Column(
              children: [
                CustomListTile(
                  icon: UserAvatarBody(userName: args.userName),
                  title: args.userName,
                  titleIsBold: true,
                  titleColor: ColorManger.myGold,
                  subTitle: language.client_name,
                  backgroundColor: Colors.transparent,
                  backgroundIconColor: Colors.transparent,
                ),
                CustomListTile(
                  icon: const Icon(CupertinoIcons.phone),
                  backgroundColor: theme.colorScheme.surface,
                  backgroundIconColor: theme.colorScheme.surfaceContainerLow,
                  title: args.phone,
                  subTitle: language.client_number,
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
            title: Text(
              language.order_summary,
              style: theme.textTheme.titleLarge,
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: kNormalMargin),
            child: Column(
              children: [
                _OrderStateSteps(
                  orderStatus: args.status,
                  orderId: args.id.toString(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomListTile(
                        icon: const Icon(CupertinoIcons.number),
                        backgroundIconColor:
                            theme.colorScheme.surfaceContainerLow,
                        title: args.requestNumber,
                        subTitle: language.order_number,
                        backgroundColor: theme.colorScheme.surface,
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
                      child: CustomListTile(
                        icon: const Icon(CupertinoIcons.cube_box_fill),
                        title:
                            '${orderDetails.cartDetail!.length} ${language.product}',
                        subTitle: language.number_of_products,
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
