part of '../one_order_view.dart';

class _AddressBody extends StatelessWidget {
  const _AddressBody();

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final order = Provider.of<OrdersDetailsResponseModel>(context);
    final language = Language.of(context);
    if (order.address != null) {
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
                  backgroundIconColor: theme.colorScheme.surfaceContainerLow,
                  backgroundColor: theme.colorScheme.surface,
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
                CustomListTile(
                  icon: const Icon(Icons.short_text_rounded),
                  title: order.address!.desc!.nullToString,
                  subTitle: language.location_desc,
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: kSpacingBetweenWidgetsHight,
        children: [
          Icon(CupertinoIcons.location_circle_fill, size: 50.w),
          Text(language.no_data, style: TextStyles.ts15B),
        ],
      );
    }
  }
}
