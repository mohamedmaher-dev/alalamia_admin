import 'package:json_annotation/json_annotation.dart';

/// Enum representing different payment methods available for orders
/// Defines all supported payment options in the order management system
/// Used for payment processing, filtering, and financial reporting
enum OrderPaymentType {
  /// Payment using Alalamia's internal wallet system
  /// Customers can pay using pre-loaded wallet balance
  @JsonValue('Alalmia Wallet')
  alalmiaWallet,

  /// Cash payment on delivery or pickup
  /// Traditional cash payment method for local transactions
  @JsonValue('Cash')
  cash,

  /// Payment through PayPal online payment system
  /// International payment option using PayPal gateway
  @JsonValue('PayPal')
  paypal,

  /// Payment using credit or debit card
  /// Card-based payment processing through payment gateway
  @JsonValue('Card')
  card,
}
