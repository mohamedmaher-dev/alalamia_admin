import 'package:json_annotation/json_annotation.dart';

enum OrderPaymentType {
  @JsonValue('Alalmia Wallet')
  alalmiaWallet,

  @JsonValue('Cash')
  cash,

  @JsonValue('PayPal')
  paypal,

  @JsonValue('Card')
  card,
}
