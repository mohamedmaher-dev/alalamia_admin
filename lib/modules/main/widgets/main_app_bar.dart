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
        title: Text(
          switch (tabsRouter.activeIndex) {
            0 => language.statistics,
            1 => language.orders,
            2 => language.settings,
            int() => throw UnimplementedError(),
          },
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
          ),
        ),
        subtitle: Text(userCredential.countryName),
      ),
      actionsPadding: EdgeInsetsDirectional.only(end: kMediumPadding),
      // actions: [
      //   if (tabsRouter.activeIndex == 1)
      //     IconButton(
      //       style: IconButton.styleFrom(
      //         backgroundColor:
      //             Theme.of(context).colorScheme.surfaceContainerLow,
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(kNormalRadius),
      //         ),
      //       ),

      //       onPressed: () {},
      //       icon: const Icon(CupertinoIcons.search),
      //     ),
      // ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
