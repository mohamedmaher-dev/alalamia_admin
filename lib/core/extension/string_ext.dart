import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

/// Extension on nullable String to handle null and empty values
/// Provides safe string conversion with localized fallback text
extension NullStringExt on String? {
  /// Convert nullable/empty string to display-safe string
  /// Returns localized "no_data" text if string is null or empty
  /// Otherwise returns the original string value
  String get nullToString =>
      this == null
          ? Language.current.no_data
          : this!.isEmpty
          ? Language.current.no_data
          : this!;
}

/// Extension on String to provide utility methods for localization
extension StringExt on String {
  /// Convert language code string to Flutter Locale object
  /// Used for converting saved language preferences to Locale instances
  Locale get stringToLocale => Locale(this);
}
