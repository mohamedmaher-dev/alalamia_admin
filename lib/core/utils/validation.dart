import 'package:alalamia_admin/core/localization/generated/l10n.dart';

/// Utility class for form validation across the application
/// Provides reusable validation methods for common input types
/// Returns localized error messages based on current language
class FormValidation {
  // Private constructor to prevent instantiation
  FormValidation._();

  /// Validate email address format and presence
  /// [value] - The email string to validate
  /// Returns error message if invalid, null if valid
  /// Checks for empty input and proper email format using regex
  static String? validateEmail(final String? value) {
    final language = Language();

    // Check if email field is empty
    if (value!.isEmpty) {
      return language.you_cannot_leave_the_email_empty;
    } else {
      // Validate email format using regular expression
      final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      );
      if (!regExp.hasMatch(value)) {
        return language.enter_a_valid_email;
      } else {
        return null; // Valid email
      }
    }
  }

  /// Validate password strength and presence
  /// [value] - The password string to validate
  /// Returns error message if invalid, null if valid
  /// Checks for empty input and minimum length requirement (8 characters)
  static String? validatePassword(final String? value) {
    final language = Language();

    // Check if password field is empty
    if (value!.trim().isEmpty) {
      return language.you_cannot_leave_the_password_empty;
    } else {
      // Check minimum password length requirement
      if (value.trim().length < 8) {
        return language.password_must_be_at_least_8_characters;
      } else {
        return null; // Valid password
      }
    }
  }

  /// Validate general text fields (used for FCM and other fields)
  /// [value] - The text string to validate
  /// Returns error message if empty, null if valid
  /// Basic validation to ensure field is not left empty
  static String? validateFcmFields(final String? value) {
    final language = Language();

    // Check if field is empty or contains only whitespace
    if (value!.trim().isEmpty) {
      return language.you_cannot_leave_this_field_empty;
    } else {
      return null; // Valid input
    }
  }
}
