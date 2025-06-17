part of '../orders_view.dart';

/// Individual order item widget displayed in the orders list
/// Provides expandable card layout with order details and navigation
/// Shows customer info, payment details, dates, and order status
class _OrderItemBody extends StatelessWidget {
  const _OrderItemBody({
    required this.index,
    required this.model,
    required this.isLoading,
  });

  /// Order data model containing all order information
  final OrdersDatum model;

  /// Index position in the list (used for initial expansion state)
  final int index;

  /// Whether this item is in loading state (for skeleton animation)
  final bool isLoading;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<OrdersCubit>();
    final language = Language.of(context);
    return Provider(
      // Provide order model to child widgets
      create: (final context) => model,
      child: GestureDetector(
        // Navigate to order details when tapped and refresh list on return
        onTap: () async {
          await context.router.push(OrderDetailsRoute(args: model));
          cubit.pagingController.refresh();
        },
        child: Skeletonizer(
          // Show skeleton loading animation when in loading state
          enabled: isLoading,
          child: Card(
            child: Column(
              children: [
                // Expandable section with customer info and details
                ExpansionTile(
                  childrenPadding: EdgeInsets.zero,
                  // Expand first item by default for better UX
                  initiallyExpanded: index == 0,
                  // Custom trailing icon with styled container
                  trailing: Container(
                    padding: EdgeInsets.all(kNormalPadding),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(kNormalRadius),
                    ),
                    child: const Icon(CupertinoIcons.chevron_down),
                  ),
                  tilePadding: EdgeInsetsDirectional.only(end: kLargePadding),
                  controlAffinity: ListTileControlAffinity.trailing,
                  // Main title showing customer info with avatar
                  title: CustomListTile(
                    icon: UserAvatarBody(userName: model.userName),
                    backgroundColor: Colors.transparent,
                    backgroundIconColor: Colors.transparent,
                    title: model.userName,
                    titleIsBold: true,
                    titleColor: ColorManger.primary,
                    subTitle: language.client_name,
                  ),
                  // Expanded content with payment and date information
                  children: <Widget>[
                    _RowItemInfo(
                      title1: model.paymentType.paymentTypeText,
                      subTitle1: language.payment_type,
                      icon1: const Icon(CupertinoIcons.money_dollar_circle),
                      // Calculate relative time (e.g., "2 hours ago")
                      title2: Jiffy.parseFromDateTime(
                        DateTime.parse(model.bookingDate).toUtc(),
                      ).from(Jiffy.parseFromDateTime(DateTime.now().toUtc())),
                      subTitle2: language.time_ago,
                      icon2: const Icon(CupertinoIcons.clock),
                    ),
                    // Formatted order date display
                    CustomListTile(
                      title: Jiffy.parse(model.bookingDate).yMMMMEEEEdjm,
                      subTitle: language.order_date,
                      icon: const Icon(CupertinoIcons.calendar),
                      isDense: true,
                    ),
                  ],
                ),
                // Contact and order identification information
                _RowItemInfo(
                  icon1: const Icon(CupertinoIcons.phone),
                  title1: model.phone,
                  subTitle1: language.client_number,
                  icon2: const Icon(CupertinoIcons.number),
                  title2: model.requestNumber,
                  subTitle2: language.order_number,
                ),
                // Order status indicator at bottom
                const _StatusBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Two-column information display widget for order details
/// Creates side-by-side layout for displaying paired information items
/// Used for phone/order number, payment/time info, etc.
class _RowItemInfo extends StatelessWidget {
  const _RowItemInfo({
    required this.title1,
    required this.subTitle1,
    required this.icon1,
    required this.title2,
    required this.subTitle2,
    required this.icon2,
  });

  /// First column title text
  final String title1;

  /// First column subtitle text
  final String subTitle1;

  /// First column icon
  final Widget icon1;

  /// Second column title text
  final String title2;

  /// Second column subtitle text
  final String subTitle2;

  /// Second column icon
  final Widget icon2;

  @override
  Widget build(final BuildContext context) => Row(
    children: [
      // Left column with first set of information
      Expanded(
        child: CustomListTile(
          title: title1,
          subTitle: subTitle1,
          icon: icon1,
          isDense: true,
        ),
      ),
      // Right column with second set of information
      Expanded(
        child: CustomListTile(
          title: title2,
          subTitle: subTitle2,
          icon: icon2,
          isDense: true,
        ),
      ),
    ],
  );
}

/// Order status indicator widget displayed at bottom of order cards
/// Shows colored status text with background matching the order status
/// Provides visual feedback for order state (pending, approved, canceled, etc.)
class _StatusBody extends StatelessWidget {
  const _StatusBody();

  @override
  Widget build(final BuildContext context) {
    final model = Provider.of<OrdersDatum>(context);
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.all(kNormalPadding),
      decoration: BoxDecoration(
        // Semi-transparent background using status color
        color: model.status.orderStatusColor.withAlpha(kBackgroundColorAlpha),
        // Rounded only bottom corners to match card design
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(kNormalRadius),
        ),
      ),
      child: Text(
        textAlign: TextAlign.center,
        // Localized status text
        model.status.orderStatusText,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
          // Text color matches the status color
          color: model.status.orderStatusColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
