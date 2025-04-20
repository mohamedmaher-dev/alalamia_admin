part of 'home_view.dart';

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar({required this.currentPage});
  final HomePages currentPage;

  @override
  Widget build(BuildContext context) {
    final userCredential = di<LocalStorageService>().userCredential!;
    final countryModel = CountryModel.fromId(userCredential.countryId);
    final language = Language.of(context);
    return AppBar(
      forceMaterialTransparency: true,
      title: ListTile(
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
        title: Text(switch (currentPage) {
          HomePages.statistics => language.statistics,
          HomePages.orders => language.orders,
          HomePages.settings => language.settings,
        }, style: TextStyles.ts15B),
        subtitle: Text(userCredential.countryName),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
