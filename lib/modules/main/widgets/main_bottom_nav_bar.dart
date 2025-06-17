part of '../main_view.dart';

/// Custom bottom navigation bar with three main sections
/// Provides elegant tab switching with rounded design and brand colors
/// Includes hidden app info feature via long-press on settings tab
class _HomeBottomNavBar extends StatelessWidget {
  const _HomeBottomNavBar({required this.tabsRouter});

  /// Tab router for handling navigation between main sections
  final TabsRouter tabsRouter;

  @override
  Widget build(final BuildContext context) {
    final language = Language.of(context);
    return SalomonBottomBar(
      // Rounded corners for modern appearance
      itemShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kNormalRadius),
      ),
      // Responsive margins for proper spacing
      margin: EdgeInsets.symmetric(horizontal: 50.h, vertical: 10.w),
      // Sync with current active tab
      currentIndex: tabsRouter.activeIndex,
      items: [
        // Statistics Tab
        SalomonBottomBarItem(
          icon: const Icon(CupertinoIcons.chart_pie),
          title: Text(
            language.statistics,
            style: const TextStyle(fontFamily: AppThemeData.fontFamily),
          ),
          selectedColor: ColorManger.myGold,
        ),
        // Orders Tab (Main/Primary section)
        SalomonBottomBarItem(
          icon: const Icon(CupertinoIcons.cube_box_fill),
          title: Text(
            language.orders,
            style: const TextStyle(fontFamily: AppThemeData.fontFamily),
          ),
          selectedColor: ColorManger.myGold,
        ),
        // Settings Tab with hidden app info feature
        SalomonBottomBarItem(
          icon: const Icon(Icons.settings),
          // Special gesture handling for settings tab
          title: GestureDetector(
            // Long press on settings shows app information modal
            onLongPress: () {
              if (tabsRouter.activeIndex == 2) {
                showModalBottomSheet(
                  context: context,
                  builder: (final context) => const AppInfoView(),
                );
              }
            },
            child: Text(
              language.settings,
              style: const TextStyle(fontFamily: AppThemeData.fontFamily),
            ),
          ),
          selectedColor: ColorManger.myGold,
        ),
      ],
      // Handle tab switching when items are tapped
      onTap: (final index) => tabsRouter.setActiveIndex(index),
    );
  }
}
