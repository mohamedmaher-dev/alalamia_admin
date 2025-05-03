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
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 6,
        vertical: kSpacingBetweenWidgetsHight,
      ),
      currentIndex: tabsRouter.activeIndex,
      items: [
        SalomonBottomBarItem(
          icon: const Icon(CupertinoIcons.chart_pie),
          title: Text(language.statistics, style: TextStyles.ts10N),
          selectedColor: ColorManger.myGold,
        ),
        SalomonBottomBarItem(
          icon: const Icon(CupertinoIcons.cube_box_fill),
          title: Text(language.orders, style: TextStyles.ts10N),
          selectedColor: ColorManger.myGold,
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.settings),
          title: Text(language.settings, style: TextStyles.ts10N),
          selectedColor: ColorManger.myGold,
        ),
      ],
      onTap: (final index) => tabsRouter.setActiveIndex(index),
    );
  }
}
