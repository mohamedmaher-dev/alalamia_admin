import 'package:alalamia_admin/core/models/country_model.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/utils/assets_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrencyView extends StatelessWidget {
  const CurrencyView({
    super.key,
    required this.countryModel,
    required this.textStyle,
  });
  final CountryModel countryModel;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) => switch (countryModel) {
    CountryModel.ksa => SvgPicture.asset(
      colorFilter: const ColorFilter.mode(ColorManger.myGold, BlendMode.srcIn),
      AssetsManger.imagesKsaCurrency,
      height: 20.h,
      width: 20.w,
    ),
    _ => Text(countryModel.currency, style: textStyle),
  };
}
