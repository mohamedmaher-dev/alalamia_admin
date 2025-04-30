part of '../main_view.dart';

class _HomeBottomNavBar extends StatelessWidget {
  const _HomeBottomNavBar({required this.tabsRouter});
  final TabsRouter tabsRouter;

  @override
  Widget build(final BuildContext context) {
    final language = Language.of(context);
    return SalomonBottomBar(
      itemShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kNormalRadius),
      ),
      margin: EdgeInsets.symmetric(horizontal: 50.h, vertical: 10.w),
      currentIndex: tabsRouter.activeIndex,
      items: [
        SalomonBottomBarItem(
          icon: const Icon(CupertinoIcons.chart_pie),
          title: Text(language.statistics, style: TextStyles.tsP10B),
          selectedColor: ColorManger.myGold,
        ),
        SalomonBottomBarItem(
          icon: const Icon(CupertinoIcons.cube_box_fill),
          title: Text(language.orders, style: TextStyles.tsP10B),
          selectedColor: ColorManger.myGold,
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.settings),
          title: Text(language.settings, style: TextStyles.tsP10B),
          selectedColor: ColorManger.myGold,
        ),
      ],
      onTap: (final index) => tabsRouter.setActiveIndex(index),
    );
  }
}
