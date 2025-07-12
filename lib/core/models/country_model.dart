import 'package:alalamia_admin/core/utils/assets_manger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// Enum representing supported countries and regions in the Alalamia Admin system
/// Each country has associated metadata including name, currency, and assets
/// Used for order filtering, localization, and region-specific features
enum CountryModel {
  /// Global/International option for worldwide orders
  // @JsonValue(null)
  // globalWithoutId(
  //   name: 'عالمي - Global',
  //   imagePath: AssetsManger.imagesGlobal,
  //   currency: 'Unknown',
  //   id: 0,
  // ),
  @JsonValue('0')
  global(
    name: 'عالمي - Global',
    imagePath: AssetsManger.imagesGlobal,
    currency: 'Unknown',
    id: 0,
  ),

  /// United Arab Emirates region
  @JsonValue(2)
  uae(name: 'الإمارات - UAE', currency: 'AED', id: 2, countryCode: 'ae'),

  /// Kingdom of Saudi Arabia region
  @JsonValue(3)
  ksa(name: 'السعودية - KSA', currency: 'SAR', id: 3, countryCode: 'sa');

  /// Unique identifier for API communication and database storage
  final int id;

  /// Display name in both Arabic and English
  final String name;

  /// Currency code for the country (AED, SAR, etc.)
  final String currency;

  /// Optional path to country flag or icon image
  final String? imagePath;

  /// ISO country code for internationalization (ae, sa, etc.)
  final String? countryCode;

  /// Constructor for country enum values with required metadata
  const CountryModel({
    required this.name,
    required this.currency,
    this.imagePath,
    required this.id,
    this.countryCode,
  });

  /// Default country selection when no specific country is chosen
  /// Returns global option for international/worldwide scope
  static CountryModel get defaultCountry => CountryModel.global;

  /// Factory method to find country by ID
  /// [id] - The country ID to search for
  /// Returns matching country or falls back to global if ID not found
  /// Used when deserializing data from API or local storage
  static CountryModel fromId(final dynamic id) =>
      CountryModel.values.firstWhere(
        (final element) => element.id == id,
        orElse: () => CountryModel.global,
      );
}
