part of '../main_view.dart';

class _MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _MainAppBar({required this.tabsRouter});
  final TabsRouter tabsRouter;

  @override
  Widget build(final BuildContext context) {
    final userCredential =
        di<LocalStorageService>().userCredential ?? UserCredential.empty();
    final countryModel = CountryModel.fromId(userCredential.countryId);
    final language = Language.of(context);
    return AppBar(
      forceMaterialTransparency: true,
      title: ListTile(
        minTileHeight: kToolbarHeight,
        contentPadding: EdgeInsets.symmetric(horizontal: kNormalPadding),
        leading:
            countryModel.countryCode != null
                ? Flag.fromString(
                  countryModel.countryCode!,
                  height: 25.r,
                  width: 25.r,
                  borderRadius: 100,
                  fit: BoxFit.fill,
                )
                : Image.asset(countryModel.imagePath!),
        title: Text(switch (tabsRouter.activeIndex) {
          0 => language.statistics,
          1 => language.orders,
          2 => language.settings,
          int() => throw UnimplementedError(),
        }),
        subtitle: Text(userCredential.countryName),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
