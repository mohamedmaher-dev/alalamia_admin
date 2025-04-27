import 'package:alalamia_admin/core/models/country_model.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:flutter/material.dart';

class ChangeCountryBtn extends StatefulWidget {
  const ChangeCountryBtn({super.key, required this.onSelectionChanged});
  final Function(CountryModel) onSelectionChanged;

  @override
  State<ChangeCountryBtn> createState() => _ChangeCountryBtnState();
}

class _ChangeCountryBtnState extends State<ChangeCountryBtn> {
  CountryModel selectedCountry = CountryModel.defaultCountry;

  @override
  Widget build(final BuildContext context) => SegmentedButton(
    style: ButtonStyle(
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kNormalRadius),
        ),
      ),
    ),
    showSelectedIcon: false,
    onSelectionChanged: (final value) {
      widget.onSelectionChanged(value.first);
      setState(() {
        selectedCountry = value.first;
      });
    },
    segments:
        CountryModel.values
            .map(
              (final country) => ButtonSegment(
                value: country,
                label: Text(country.name),
                // icon: Image.asset(country.imagePath, height: 15.h),
              ),
            )
            .toList(),
    selected: {selectedCountry},
  );
}
