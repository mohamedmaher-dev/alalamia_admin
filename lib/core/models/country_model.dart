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
  uae(name: 'الإمارات - UAE', currency: 'AED', id: 2, countryCode: 'ae'),
  @JsonValue(3)
  ksa(name: 'السعودية - KSA', currency: 'SAR', id: 3, countryCode: 'sa');

  final int id;
  final String name;
  final String currency;
  final String? imagePath;
  final String? countryCode;
  const CountryModel({
    required this.name,
    required this.currency,
    this.imagePath,
    required this.id,
    this.countryCode,
  });

  static CountryModel get defaultCountry => CountryModel.global;

  static CountryModel fromId(final dynamic id) =>
      CountryModel.values.firstWhere(
        (final element) => element.id == id,
        orElse: () => CountryModel.global,
      );
}
