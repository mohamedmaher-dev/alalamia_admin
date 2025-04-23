part of '../one_order_view.dart';

class _AddressBody extends StatelessWidget {
  const _AddressBody({required this.order, required this.args});
  final OrdersDetailsResponseModel order;
  final OrdersDatum args;

  @override
  Widget build(BuildContext context) {
    final language = Language.of(context);
    if (order.address != null) {
      return Column(
        children: [
          ListTile(
            leading: Icon(CupertinoIcons.location_circle_fill),
            title: Text(language.address, style: TextStyles.ts15B),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: kNormalMargin),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text(order.address!.name.nullToString, maxLines: 2),
                  subtitle: Text(language.address),
                  trailing: Icon(CupertinoIcons.chevron_left),
                  onTap: () async {
                    await MapLauncher.installedMaps.then(
                      (value) => value.first.showMarker(
                        coords: Coords(
                          order.address!.latLong.lat,
                          order.address!.latLong.long,
                        ),
                        title: order.address!.name.nullToString,
                      ),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.short_text_rounded),
                  title: Text(order.address!.desc!.nullToString, maxLines: 2),
                  subtitle: Text(language.location_desc),
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
