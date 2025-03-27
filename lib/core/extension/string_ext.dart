import 'package:alalamia_admin/core/localization/generated/l10n.dart';

extension StringExt on String? {
  String get nullToString => this ?? Language.current.no_data;
}
