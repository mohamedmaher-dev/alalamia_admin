import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/order_status.dart';
import 'package:flutter/material.dart';

/// Extension on OrderStatus enum to provide utility methods for UI and API operations
/// Handles localization, color coding, indexing, and string conversion for order statuses
/// Supports multiple order status types with consistent mapping across the application
extension OrderStatusExt on OrderStatus {
  /// Get localized display text for the order status
  /// Returns user-friendly status text based on current app language
  /// Groups similar statuses under common display categories
  String get orderStatusText {
    final language = Language();
    switch (this) {
      // Under Review - Initial status when order is submitted
      case OrderStatus.requested:
        return language.status_review;
      // Approved - Order confirmed and accepted
      case OrderStatus.received:
      case OrderStatus.reviewed:
        return language.status_approved;
      // Preparing - Order being processed/prepared
      case OrderStatus.repair:
      case OrderStatus.onBranch:
        return language.status_preparing;
      // On The Way - Order out for delivery
      case OrderStatus.deliver:
      case OrderStatus.onTheWay:
        return language.status_on_the_way;
      // Delivered - Order successfully completed
      case OrderStatus.delivered:
      case OrderStatus.completedRequest:
      case OrderStatus.done:
        return language.status_delivered;
      // Canceled - Order cancelled or rejected
      case OrderStatus.canceled:
        return language.status_canceled;
      // Other/Unknown status
      case OrderStatus.external:
        return language.no_data;
    }
  }

  /// Get color coding for order status display in UI
  /// Provides visual distinction between different order states
  /// Uses consistent color scheme across the application
  Color get orderStatusColor {
    switch (this) {
      // Under Review - Grey for pending/waiting status
      case OrderStatus.requested:
        return Colors.grey;
      // Approved - Purple for confirmed orders
      case OrderStatus.received:
        return Colors.purple[300]!;
      // Preparing - Orange for in-progress orders
      case OrderStatus.repair:
        return Colors.orange;
      // On The Way - Blue for delivery in progress
      case OrderStatus.deliver:
        return Colors.blue;
      // Delivered - Green for successful completion
      case OrderStatus.delivered:
        return Colors.green;
      // Canceled - Red for cancelled/failed orders
      case OrderStatus.canceled:
        return Colors.red;
      // Other statuses - App's brand color (gold)
      case OrderStatus.external:
      case OrderStatus.reviewed:
      case OrderStatus.onBranch:
      case OrderStatus.onTheWay:
      case OrderStatus.completedRequest:
      case OrderStatus.done:
        return ColorManger.myGold;
    }
  }

  /// Convert order status enum to index for UI selection widgets
  /// Maps status categories to numbered indices for dropdowns, steppers, etc.
  /// Provides consistent ordering for status progression UI
  int get enumToindex {
    switch (this) {
      // Under Review - Index 0
      case OrderStatus.requested:
        return 0;
      // Approved - Index 1
      case OrderStatus.received:
        return 1;
      // Preparing - Index 2
      case OrderStatus.repair:
        return 2;
      // On The Way - Index 3
      case OrderStatus.deliver:
        return 3;
      // Delivered - Index 4
      case OrderStatus.delivered:
        return 4;
      // Canceled - Index 5
      case OrderStatus.canceled:
        return 5;
      // Other statuses - Index 6
      case OrderStatus.external:
      case OrderStatus.reviewed:
      case OrderStatus.onBranch:
      case OrderStatus.onTheWay:
      case OrderStatus.completedRequest:
      case OrderStatus.done:
        return 6;
    }
  }

  /// Convert order status enum to string for API communication
  /// Provides exact string values expected by the backend API
  /// Each enum value maps to its corresponding API string identifier
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
