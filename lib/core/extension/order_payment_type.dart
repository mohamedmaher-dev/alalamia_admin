import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/order_payment_type.dart';

/// Extension on OrderPaymentType enum to provide localized display text
/// Converts payment type enums to user-readable localized strings
/// Supports multiple languages based on current app locale
extension OrderPaymentTypeExt on OrderPaymentType {
  /// Get localized display text for the payment type
  /// Returns the appropriate localized string based on current language
  /// Used in UI to show payment method to users
  String get paymentTypeText {
    final language = Language.current;
    switch (this) {
      // Alalamia internal wallet payment
      case OrderPaymentType.alalmiaWallet:
        return language.alalmia_wallet;
      // Cash on delivery payment
      case OrderPaymentType.cash:
        return language.cash;
      // PayPal online payment
      case OrderPaymentType.paypal:
        return language.paypal;
      // Credit/debit card payment
      case OrderPaymentType.card:
        return language.card;
    }
  }
}
