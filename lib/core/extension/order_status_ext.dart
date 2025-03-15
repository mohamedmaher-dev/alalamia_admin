import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/order_status.dart';
import 'package:flutter/material.dart';

extension OrderStatusExt on OrderStatus {
  String get orderStatusText {
    final language = Language();
    switch (this) {
      // Under Review
      case OrderStatus.requested:
        return language.status_review;
      // Approved
      case OrderStatus.received:
      case OrderStatus.reviewed:
        return language.status_approved;
      // Preparing
      case OrderStatus.repair:
      case OrderStatus.onBranch:
        return language.status_preparing;
      // On The Way
      case OrderStatus.deliver:
      case OrderStatus.onTheWay:
        return language.status_on_the_way;
      // Delivered
      case OrderStatus.delivered:
      case OrderStatus.completedRequest:
      case OrderStatus.done:
        return language.status_delivered;
      // Canceled
      case OrderStatus.canceled:
        return language.status_canceled;
      // Other
      case OrderStatus.external:
        return language.no_data;
    }
  }

  Color get orderStatusColor {
    switch (this) {
      // Under Review
      case OrderStatus.requested:
        return Colors.grey;
      // Approved
      case OrderStatus.received:
        return Colors.purple;
      // Preparing
      case OrderStatus.repair:
        return Colors.orange;
      // On The Way
      case OrderStatus.deliver:
        return Colors.blue;
      // Delivered
      case OrderStatus.delivered:
        return Colors.green;
      // Canceled
      case OrderStatus.canceled:
        return Colors.red;
      // Other
      case OrderStatus.external:
      case OrderStatus.reviewed:
      case OrderStatus.onBranch:
      case OrderStatus.onTheWay:
      case OrderStatus.completedRequest:
      case OrderStatus.done:
        return ColorManger.myGold;
    }
  }

  int get enumToindex {
    switch (this) {
      // Under Review
      case OrderStatus.requested:
        return 0;
      // Approved
      case OrderStatus.received:
        return 1;
      // Preparing
      case OrderStatus.repair:
        return 2;
      // On The Way
      case OrderStatus.deliver:
        return 3;
      // Delivered
      case OrderStatus.delivered:
        return 4;
      // Canceled
      case OrderStatus.canceled:
        return 5;
      // Other
      case OrderStatus.external:
      case OrderStatus.reviewed:
      case OrderStatus.onBranch:
      case OrderStatus.onTheWay:
      case OrderStatus.completedRequest:
      case OrderStatus.done:
        return 6;
    }
  }

  String get statusString {
    switch (this) {
      case OrderStatus.requested:
        return 'requested';
      case OrderStatus.received:
        return 'received';
      case OrderStatus.reviewed:
        return 'reviewed';
      case OrderStatus.repair:
        return 'repair';
      case OrderStatus.onBranch:
        return 'on_branch';
      case OrderStatus.deliver:
        return 'deliver';
      case OrderStatus.onTheWay:
        return 'on_the_way';
      case OrderStatus.delivered:
        return 'delivered';
      case OrderStatus.completedRequest:
        return 'completedRequest';
      case OrderStatus.done:
        return 'done';
      case OrderStatus.canceled:
        return 'canceled';
      case OrderStatus.external:
        return 'external';
    }
  }
}
