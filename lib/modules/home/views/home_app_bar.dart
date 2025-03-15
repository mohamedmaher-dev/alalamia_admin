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
          LocalStorageService.userCredential!.countryFlagPath,
        ),
        title: Text(switch (currentPage) {
          HomePages.statistics => language.statistics,
          HomePages.orders => language.orders,
          HomePages.settings => language.settings,
        }),
        subtitle: Text(LocalStorageService.userCredential!.email),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
