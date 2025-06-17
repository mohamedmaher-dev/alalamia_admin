part of '../one_order_view.dart';

/// General information section widget for order details screen
/// Displays customer information, order summary, and status tracking
/// First tab in the order details tabbed interface providing essential order data
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
          // Client Information Section Header
          ListTile(
            leading: const Icon(CupertinoIcons.person_circle_fill),
            title: Text(
              language.client_info,
              style: theme.textTheme.titleLarge,
            ),
          ),
          // Client Information Card
          Card(
            margin: EdgeInsets.symmetric(horizontal: kNormalMargin),
            child: Column(
              children: [
                // Customer name with avatar
                CustomListTile(
                  icon: UserAvatarBody(userName: args.userName),
                  title: args.userName,
                  titleIsBold: true,
                  titleColor: ColorManger.myGold,
                  subTitle: language.client_name,
                  backgroundColor: Colors.transparent,
                  backgroundIconColor: Colors.transparent,
                ),
                // Customer phone number with copy functionality
                CustomListTile(
                  icon: const Icon(CupertinoIcons.phone),
                  backgroundColor: theme.colorScheme.surface,
                  backgroundIconColor: theme.colorScheme.surfaceContainerLow,
                  title: args.phone,
                  subTitle: language.client_number,
                  trailing: IconButton(
                    // Copy phone number to clipboard when pressed
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: args.phone));
                    },
                    icon: const Icon(Icons.copy),
                  ),
                ),
              ],
            ),
          ),
          // Order Summary Section Header
          ListTile(
            leading: const Icon(CupertinoIcons.cube_box_fill),
            title: Text(
              language.order_summary,
              style: theme.textTheme.titleLarge,
            ),
          ),
          // Order Summary Information Card
          Card(
            margin: EdgeInsets.symmetric(horizontal: kNormalMargin),
            child: Column(
              children: [
                // Show order status steps for non-canceled orders
                if (args.status != OrderStatus.canceled)
                  const _OrderStateSteps(),
                // Show cancellation details for canceled orders
                if (args.status == OrderStatus.canceled) const _CancelBody(),
                Row(
                  children: [
                    // Order number with long press to copy
                    Expanded(
                      child: CustomListTile(
                        icon: const Icon(CupertinoIcons.number),
                        backgroundIconColor:
                            theme.colorScheme.surfaceContainerLow,
                        title: args.requestNumber,
                        subTitle: language.order_number,
                        backgroundColor: theme.colorScheme.surface,
                        onLongPress: () async {
                          // Copy order number to clipboard and show success message
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
                    // Total products count in the order
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

/// Cancellation information widget for canceled orders
/// Displays cancellation status and reason/note when an order is canceled
/// Provides visual feedback with status-colored background and detailed cancellation info
class _CancelBody extends StatelessWidget {
  const _CancelBody();

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final language = Language.of(context);
    final args = Provider.of<OrdersDatum>(context);
    final orderDetails = Provider.of<OrdersDetailsResponseModel>(context);

    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.all(kNormalMargin),
      padding: EdgeInsets.all(kNormalMargin),
      decoration: BoxDecoration(
        // Semi-transparent background using order status color (red for canceled)
        color: args.status.orderStatusColor.withAlpha(kBackgroundColorAlpha),
        borderRadius: BorderRadius.circular(kNormalRadius),
      ),
      child: Column(
        children: [
          // Cancellation status title with status color
          Text(
            language.status_canceled,
            style: theme.textTheme.titleLarge!.copyWith(
              color: args.status.orderStatusColor,
            ),
          ),
          // Cancellation reason/note (if available)
          Text(
            orderDetails.cancelNote.nullToString,
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
