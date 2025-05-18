part of '../one_order_view.dart';

class _OtherBody extends StatelessWidget {
  const _OtherBody();
  @override
  Widget build(final BuildContext context) => const SingleChildScrollView(
    child: Column(children: [_AddressBody(), _OtherInfoBody()]),
  );
}

class _OtherInfoBody extends StatelessWidget {
  const _OtherInfoBody();

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);

    final language = Language.of(context);

    final args = Provider.of<OrdersDatum>(context);
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.more_rounded),
          title: Text(language.other_info, style: theme.textTheme.titleLarge),
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: kNormalMargin),
          child: Column(
            children: [
              CustomListTile(
                icon: const Icon(CupertinoIcons.money_dollar),
                title: args.paymentType.paymentTypeText,
                subTitle: language.payment_type,
                backgroundColor: theme.colorScheme.surfaceContainerLow,
                backgroundIconColor: theme.colorScheme.surface,
              ),
              const Divider(),
              CustomListTile(
                icon: const Icon(Icons.delivery_dining),
                title:
                    args.aramexId == null
                        ? language.no_data
                        : args.aramexId.toString(),

                subTitle: language.aramex_number,
                trailing: IconButton(
                  icon: const Icon(Icons.copy),
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

class _AddressBody extends StatelessWidget {
  const _AddressBody();

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final order = Provider.of<OrdersDetailsResponseModel>(context);
    final language = Language.of(context);
    return Column(
      children: [
        ListTile(
          leading: const Icon(CupertinoIcons.location_circle_fill),
          title: Text(language.address, style: theme.textTheme.titleLarge),
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: kNormalMargin),
          child: Column(
            children: [
              CustomListTile(
                icon: const Icon(Icons.location_on),
                backgroundColor: theme.colorScheme.surfaceContainerLow,
                backgroundIconColor: theme.colorScheme.surface,
                title: order.address!.name.nullToString,
                subTitle: language.address,
                trailing: const Icon(CupertinoIcons.chevron_left),
                onTap: () async {
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
