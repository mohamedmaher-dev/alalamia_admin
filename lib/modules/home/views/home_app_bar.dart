part of 'home_view.dart';

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar({required this.currentPage});
  final HomePages currentPage;

  @override
  Widget build(BuildContext context) {
    final language = Language.of(context);
    return AppBar(
      forceMaterialTransparency: true,
      title: ListTile(
        leading: Image.asset(
          LocalStorageService.userCredential == null
              ? AssetsManger.imagesKsa
              : AssetsManger.imagesUae,
        ),
        title: Text(switch (currentPage) {
          HomePages.statistics => language.statistics,
          HomePages.orders => language.orders,
          HomePages.settings => language.settings,
        }, style: TextStyles.ts15B),
        subtitle: Text(
          LocalStorageService.userCredential == null ? '' : '',
          style: TextStyles.tsP10B,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
