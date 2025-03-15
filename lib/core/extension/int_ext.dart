import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/order_status.dart';

extension IntExt on int {
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
