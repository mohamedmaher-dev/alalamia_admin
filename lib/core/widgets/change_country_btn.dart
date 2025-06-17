import 'package:alalamia_admin/core/models/country_model.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:flutter/material.dart';

/// Country selection widget using segmented button design
/// Allows users to choose between different supported countries/regions
/// Provides callback when selection changes for parent widget handling
class ChangeCountryBtn extends StatefulWidget {
  const ChangeCountryBtn({super.key, required this.onSelectionChanged});

  /// Callback function executed when user selects a different country
  /// Passes the selected CountryModel to the parent widget
  final Function(CountryModel) onSelectionChanged;

  @override
  State<ChangeCountryBtn> createState() => _ChangeCountryBtnState();
}

/// State class for country selection button with selection tracking
/// Manages currently selected country and handles selection changes
class _ChangeCountryBtnState extends State<ChangeCountryBtn> {
  /// Currently selected country, defaults to global/international option
  CountryModel selectedCountry = CountryModel.defaultCountry;

  @override
  Widget build(final BuildContext context) => SegmentedButton(
    style: ButtonStyle(
      // Rounded corners matching app design language
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kNormalRadius),
        ),
      ),
    ),
    // Hide checkmark icon for cleaner appearance
    showSelectedIcon: false,
    // Handle country selection changes
    onSelectionChanged: (final value) {
      // Notify parent widget of the selection change
      widget.onSelectionChanged(value.first);
      // Update internal state to reflect new selection
      setState(() {
        selectedCountry = value.first;
      });
    },
    // Generate button segments for all available countries
    segments:
        CountryModel.values
            .map(
              (final country) => ButtonSegment(
                value: country,
                // Display country name (both Arabic and English)
                label: Text(country.name),
                // Optional: Country flag icon (currently commented out)
                // icon: Image.asset(country.imagePath, height: 15.h),
              ),
            )
            .toList(),
    // Set which country is currently selected
    selected: {selectedCountry},
  );
}
