import 'package:alalamia_admin/core/localization/generated/l10n.dart';

class FormValidation {
  FormValidation._();
  static String? validateEmail(String? value) {
    final language = Language();
    if (value!.isEmpty) {
      return language.you_cannot_leave_the_email_empty;
    } else {
      final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      );
      if (!regExp.hasMatch(value)) {
        return language.enter_a_valid_email;
      } else {
        return null;
      }
    }
  }

  static String? validatePassword(String? value) {
    final language = Language();

    if (value!.trim().isEmpty) {
      return language.you_cannot_leave_the_password_empty;
    } else {
      if (value.trim().length < 8) {
        return language.password_must_be_at_least_8_characters;
      } else {
        return null;
      }
    }
  }

  static String? validateFcmFields(String? value) {
    final language = Language();
    if (value!.trim().isEmpty) {
      return language.you_cannot_leave_this_field_empty;
    } else {
      return null;
    }
  }
}
