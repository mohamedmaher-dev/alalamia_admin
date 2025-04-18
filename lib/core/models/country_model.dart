import 'package:alalamia_admin/core/utils/assets_manger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum CountryModel {
  @JsonValue('0')
  global(
    name: 'عالمي - Global',
    imagePath: AssetsManger.imagesGlobal,
    currency: 'Unknown',
    id: 0,
  ),
  @JsonValue(2)
  uae(
    name: 'الإمارات - UAE',
    imagePath: AssetsManger.imagesUae,
    currency: 'AED',
    id: 2,
  ),
  @JsonValue(3)
  ksa(
    name: 'السعودية - KSA',
    imagePath: AssetsManger.imagesKsa,
    currency: 'SAR',
    id: 3,
  );

  final int id;
  final String name;
  final String currency;
  final String imagePath;
  const CountryModel({
    required this.name,
    required this.currency,
    required this.imagePath,
    required this.id,
  });

  static CountryModel get defaultCountry => CountryModel.global;
}
