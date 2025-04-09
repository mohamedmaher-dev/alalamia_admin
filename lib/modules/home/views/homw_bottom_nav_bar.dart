part of 'home_view.dart';

class _HomeBottomNavBar extends StatelessWidget {
  const _HomeBottomNavBar({required this.currentIndex});
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeNavCubit>();
    final language = Language.of(context);
    return BlocBuilder<AppConfig, AppConfigModel>(
      builder: (context, state) {
        return SalomonBottomBar(
          margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          currentIndex: currentIndex,
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
          onTap: (index) => cubit.changePage(HomePages.values[index]),
        );
      },
    );
  }
}
