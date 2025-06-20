import 'package:alalamia_admin/core/models/country_model.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/utils/assets_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Currency display widget that shows appropriate currency symbol or icon
/// Provides special handling for Saudi Riyal with custom SVG icon
/// Falls back to text display for other currencies
class CurrencyView extends StatelessWidget {
  const CurrencyView({
    super.key,
    required this.countryModel,
    required this.textStyle,
  });

  /// Country model containing currency information
  final CountryModel countryModel;

  /// Text style to apply when displaying currency as text
  final TextStyle textStyle;

  @override
  Widget build(final BuildContext context) => switch (countryModel) {
    // Special case for Saudi Arabia - display custom SVG icon
    CountryModel.ksa => SvgPicture.asset(
      // Apply gold color filter to match app branding
      colorFilter: const ColorFilter.mode(ColorManger.myGold, BlendMode.srcIn),
      AssetsManger.imagesKsaCurrency,
      height: 20.h,
      width: 20.w,
    ),
    // Default case - display currency symbol as text
    _ => Text(countryModel.currency, style: textStyle),
  };
}
