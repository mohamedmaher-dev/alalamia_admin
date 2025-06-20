import 'package:json_annotation/json_annotation.dart';

/// Enum representing different order status values in the order management system
/// Defines the complete order lifecycle from initial request to completion
/// Used for order filtering, status tracking, and workflow management
enum OrderStatus {
  /// Initial status when customer places an order
  /// Order is waiting for admin review and approval
  @JsonValue('requested')
  requested,

  /// Status indicating order needs repair or correction
  /// Used when order has issues that need to be fixed
  @JsonValue('repair')
  repair,

  /// Final status when order has been delivered to customer
  /// Indicates successful completion of the order delivery
  @JsonValue('delivered')
  delivered,

  /// Status when order is being delivered (in transit)
  /// Order is currently being transported to customer
  @JsonValue('deliver')
  deliver,

  /// Status when order has been reviewed by admin
  /// Admin has assessed the order but not yet approved
  @JsonValue('reviewed')
  reviewed,

  /// Status when order has been canceled
  /// Order was terminated before completion (by admin or customer)
  @JsonValue('canceled')
  canceled,

  /// Status when order has been received by customer
  /// Customer has confirmed receipt of the order
  @JsonValue('received')
  received,

  /// Status indicating order processing is complete
  /// All order activities have been finished
  @JsonValue('done')
  done,

  /// Status for fully completed order requests
  /// Final state indicating successful order fulfillment
  @JsonValue('completedRequest')
  completedRequest,

  /// Status when order is currently being delivered
  /// Order is on route to customer destination
  @JsonValue('on_the_way')
  onTheWay,

  /// Status when order is at local branch/pickup point
  /// Order is ready for pickup or local delivery dispatch
  @JsonValue('on_branch')
  onBranch,

  /// Status for orders handled by external delivery services
  /// Order is managed by third-party delivery providers
  @JsonValue('external')
  external,
}
