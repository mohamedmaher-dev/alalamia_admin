import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/order_payment_type.dart';

extension OrderPaymentTypeExt on OrderPaymentType {
  String get paymentTypeText {
    final language = Language.current;
    switch (this) {
      case OrderPaymentType.alalmiaWallet:
        return language.alalmia_wallet;
      case OrderPaymentType.cash:
        return language.cash;
      case OrderPaymentType.paypal:
        return language.paypal;
      case OrderPaymentType.card:
        return language.card;
    }
  }
}
