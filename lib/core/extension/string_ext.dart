import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

extension NullStringExt on String? {
  String get nullToString =>
      this == null
          ? Language.current.no_data
          : this!.isEmpty
          ? Language.current.no_data
          : this!;
}

extension StringExt on String {
  Locale get stringToLocale => Locale(this);
}
