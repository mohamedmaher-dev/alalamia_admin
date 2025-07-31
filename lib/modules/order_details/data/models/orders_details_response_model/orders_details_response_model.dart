import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'cart_detail.dart';

part 'orders_details_response_model.g.dart';

/// Order details response model containing complete order information
/// Represents comprehensive order data received from the backend API
/// Used for displaying detailed order information in order details screens
@JsonSerializable()
class OrdersDetailsResponseModel {
  /// Customer's full name who placed the order
  /// Used for displaying customer information and invoice generation
  @JsonKey(name: 'user_name')
  final String? userName;

  /// Unique order request number for tracking and reference
  /// Used for order identification and customer support
  @JsonKey(name: 'request_no')
  final String? requestNo;

  /// List of all cart items/products in the order
  /// Contains detailed product information including quantities and prices
  @JsonKey(name: 'cart_detail')
  final List<CartDetail>? cartDetail;

  /// Total number of items in the cart (sum of all quantities)
  /// Used for quick item count display
  final int? sum;

  /// Total monetary value of all items in the order
  /// Used for price calculations and invoice totals
  @JsonKey(name: 'price_sum')
  final dynamic priceSumDynamic;

  /// Coupon or discount code applied to the order (dynamic type for flexibility)
  /// Can be string, object, or null based on backend implementation
  final dynamic coupon;

  /// Remaining amount to be paid (dynamic type for payment flexibility)
  /// Supports partial payments and various payment structures
  @JsonKey(name: 'remaining_amount')
  final dynamic remainingAmount;

  /// Type of order fulfillment (pickup, delivery, etc.)
  /// Determines how the customer will receive their order
  @JsonKey(name: 'receiving_type')
  final String? receivingType;

  /// Delivery address information with geographic coordinates
  /// Contains complete address details for order delivery
  final Address? address;

  /// Additional order description or special instructions
  /// Customer notes or special handling requirements
  final String? desc;

  /// Cancellation note if the order was canceled
  /// Admin or customer explanation for order cancellation
  @JsonKey(name: 'cancel_note')
  final String? cancelNote;

  /// Hospitality or special service information (dynamic type)
  /// Additional services or amenities provided with the order
  final dynamic hospitality;

  /// Payment method used for the order (cash, card, online, etc.)
  /// Determines payment processing and handling requirements
  @JsonKey(name: 'payment_type')
  final String? paymentType;

  /// Cash payment amount if paid in cash
  /// Used for cash handling and change calculation
  @JsonKey(name: 'cache_payment')
  final String? cachePayment;

  /// Branch or location where the order was processed
  /// Used for order management and logistics
  final String? branch;

  /// Order creation timestamp in ISO format
  /// Used for order tracking and audit trails
  @JsonKey(name: 'created_at')
  final String? createdAt;

  /// Human-readable time difference from order creation
  /// Used for displaying relative time (e.g., "2 hours ago")
  @JsonKey(name: 'created_at_diffForHumans')
  final String? createdAtDiffForHumans;

  /// Creates an order details response instance with complete order information
  /// All parameters are optional to handle various API response formats and partial data
  const OrdersDetailsResponseModel({
    this.userName,
    this.requestNo,
    this.cartDetail,
    this.sum,
    this.priceSumDynamic,
    this.coupon,
    this.remainingAmount,
    this.receivingType,
    this.address,
    this.desc,
    this.cancelNote,
    this.hospitality,
    this.paymentType,
    this.cachePayment,
    this.branch,
    this.createdAt,
    this.createdAtDiffForHumans,
  });

  /// Factory constructor for creating OrdersDetailsResponseModel from JSON response
  /// Used by the API service to deserialize complete order details from backend
  factory OrdersDetailsResponseModel.fromJson(
    final Map<String, dynamic> json,
  ) => _$OrdersDetailsResponseModelFromJson(json);

  /// Converts order details instance to JSON for API requests or storage
  /// Used when sending order data to backend or caching locally
  Map<String, dynamic> toJson() => _$OrdersDetailsResponseModelToJson(this);

  /// Returns the total price sum of all cart items in the order
  String get priceSum => priceSumDynamic.toString();
}
