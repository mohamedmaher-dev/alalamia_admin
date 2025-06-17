part of '../main_view.dart';

/// Main application bar with dynamic content based on active tab
/// Displays country information, current section name, and optional actions
/// Integrates with tab router to show contextual information
class _MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _MainAppBar({required this.tabsRouter});

  /// Tab router for accessing current tab index and navigation state
  final TabsRouter tabsRouter;

  @override
  Widget build(final BuildContext context) {
    // Get current user credentials and country information
    final userCredential =
        di<LocalStorageService>().userCredential ?? UserCredential.empty();
    final countryModel = CountryModel.fromId(userCredential.countryId);
    final language = Language.of(context);

    return AppBar(
      // Transparent background for modern look
      forceMaterialTransparency: true,
      // Custom title layout with country flag and section name
      title: ListTile(
        minTileHeight: kToolbarHeight,
        // Display country flag or icon
        leading:
            countryModel.countryCode != null
                // Show flag widget for countries with ISO codes
                ? Flag.fromString(
                  countryModel.countryCode!,
                  height: 25.r,
                  width: 25.r,
                  borderRadius: 100,
                  fit: BoxFit.fill,
                )
                // Fallback to image asset for countries without flags
                : Image.asset(countryModel.imagePath!),
        // Dynamic title based on active tab
        title: Text(
          switch (tabsRouter.activeIndex) {
            0 => language.statistics, // Statistics tab
            1 => language.orders, // Orders tab
            2 => language.settings, // Settings tab
            int() => throw UnimplementedError(),
          },
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
          ),
        ),
        // Show selected country name as subtitle
        subtitle: Text(userCredential.countryName),
      ),
      // Consistent padding for action buttons
      actionsPadding: EdgeInsetsDirectional.only(end: kMediumPadding),

      // Commented out search action for future implementation
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
