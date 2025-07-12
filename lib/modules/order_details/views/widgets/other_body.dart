part of '../one_order_view.dart';

/// Additional information section widget for order details screen
/// Displays address, payment type, and delivery tracking information
/// Third tab in the order details interface providing supplementary order data
class _OtherBody extends StatelessWidget {
  const _OtherBody();

  @override
  Widget build(final BuildContext context) {
    final details = Provider.of<OrdersDetailsResponseModel>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          // Customer delivery address information
          if (details.address != null) const _AddressBody(),
          // Additional order information (payment, tracking)
          const _OtherInfoBody(),
        ],
      ),
    );
  }
}

/// Additional order information widget displaying payment and delivery details
/// Shows payment type and delivery tracking information with interactive elements
/// Provides copy functionality for tracking numbers and external integrations
class _OtherInfoBody extends StatelessWidget {
  const _OtherInfoBody();

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final language = Language.of(context);
    final args = Provider.of<OrdersDatum>(context);

    return Column(
      children: [
        // Section header for other information
        ListTile(
          leading: const Icon(Icons.more_rounded),
          title: Text(language.other_info, style: theme.textTheme.titleLarge),
        ),
        // Information card containing payment and delivery details
        Card(
          margin: EdgeInsets.symmetric(horizontal: kNormalMargin),
          child: Column(
            children: [
              // Payment type information display
              CustomListTile(
                icon: const Icon(CupertinoIcons.money_dollar),
                title: args.paymentType.paymentTypeText,
                subTitle: language.payment_type,
                backgroundColor: theme.colorScheme.surfaceContainerLow,
                backgroundIconColor: theme.colorScheme.surface,
              ),
              if (args.aramexId != null) const Divider(),
              // Delivery tracking number with copy functionality
              if (args.aramexId != null)
                CustomListTile(
                  icon: const Icon(Icons.delivery_dining),
                  title: args.aramexId.toString(),
                  subTitle: language.aramex_number,
                  trailing: IconButton(
                    icon: const Icon(Icons.copy),
                    // Copy tracking number to clipboard when pressed
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: args.aramexId.toString()),
                      );
                    },
                  ),
                  backgroundColor: theme.colorScheme.surfaceContainerLow,
                  backgroundIconColor: theme.colorScheme.surface,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Customer address information widget with map integration
/// Displays delivery address details and provides map navigation functionality
/// Integrates with MapLauncher for external map application support
class _AddressBody extends StatelessWidget {
  const _AddressBody();

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final order = Provider.of<OrdersDetailsResponseModel>(context);
    final language = Language.of(context);

    return Column(
      children: [
        // Section header for address information
        ListTile(
          leading: const Icon(CupertinoIcons.location_circle_fill),
          title: Text(language.address, style: theme.textTheme.titleLarge),
        ),
        // Address information card with map integration
        Card(
          margin: EdgeInsets.symmetric(horizontal: kNormalMargin),
          child: Column(
            children: [
              // Address name with map navigation functionality
              CustomListTile(
                icon: const Icon(Icons.location_on),
                backgroundColor: theme.colorScheme.surfaceContainerLow,
                backgroundIconColor: theme.colorScheme.surface,
                title: order.address!.name.nullToString,
                subTitle: language.address,
                trailing: const Icon(CupertinoIcons.chevron_left),
                onTap: () async {
                  // Open address in external map application
                  await MapLauncher.installedMaps.then(
                    (final value) => value.first.showMarker(
                      coords: Coords(
                        order.address!.latLong.lat,
                        order.address!.latLong.long,
                      ),
                      title: order.address!.name.nullToString,
                    ),
                  );
                },
              ),
              const Divider(),
              // Address description/additional details
              CustomListTile(
                icon: const Icon(Icons.short_text_rounded),
                title: order.address!.desc!.nullToString,
                subTitle: language.location_desc,
                backgroundColor: theme.colorScheme.surfaceContainerLow,
                backgroundIconColor: theme.colorScheme.surface,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
