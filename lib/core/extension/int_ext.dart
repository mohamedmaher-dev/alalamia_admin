import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/order_status.dart';

/// Extension on int to provide utility methods for order status conversion
/// Converts integer indices to corresponding OrderStatus enum values
extension IntExt on int {
  /// Convert integer index to OrderStatus enum
  /// Used for mapping UI selection indices to API enum values
  ///
  /// Index mapping:
  /// 0 -> requested (order submitted, awaiting review)
  /// 1 -> received (order confirmed and received)
  /// 2 -> repair (order being prepared/processed)
  /// 3 -> deliver (order out for delivery)
  /// 4 -> delivered (order successfully delivered)
  /// 5 -> canceled (order cancelled)
  /// default -> external (unknown/external status)
  OrderStatus get indexToEnum {
    switch (this) {
      case 0:
        return OrderStatus.requested;
      case 1:
        return OrderStatus.received;
      case 2:
        return OrderStatus.repair;
      case 3:
        return OrderStatus.deliver;
      case 4:
        return OrderStatus.delivered;
      case 5:
        return OrderStatus.canceled;
      default:
        return OrderStatus.external;
    }
  }
}
