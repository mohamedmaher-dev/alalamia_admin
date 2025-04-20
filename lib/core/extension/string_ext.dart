import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

extension NullStringExt on String? {
  String get nullToString => this ?? Language.current.no_data;
}

extension StringExt on String {
  Locale get stringToLocale => Locale(this);
}
