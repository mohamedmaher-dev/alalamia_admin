import 'package:alalamia_admin/core/utils/assets_manger.dart';

enum CountryModel {
  ksa(name: 'KSA', imagePath: AssetsManger.imagesKsa),
  uae(name: 'UAE', imagePath: AssetsManger.imagesUae);

  final String name;
  final String imagePath;
  const CountryModel({required this.name, required this.imagePath});

  static CountryModel get defaultCountry => CountryModel.ksa;
}
