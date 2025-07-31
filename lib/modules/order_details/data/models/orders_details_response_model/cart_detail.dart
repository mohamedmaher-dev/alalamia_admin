import 'package:json_annotation/json_annotation.dart';

import 'unit.dart';

part 'cart_detail.g.dart';

/// Cart detail model representing individual product items within an order
/// Contains complete product information including quantities, prices, and units
/// Used for displaying order contents in cart views and generating invoices
@JsonSerializable()
class CartDetail {
  /// Stock keeping unit (SKU) - unique product identifier
  /// Used for inventory tracking and product identification
  @JsonKey(name: 'sku')
  final dynamic skuDynamic;

  /// Product name in Arabic language
  /// Primary product display name for Arabic-speaking users
  @JsonKey(name: 'product_ar')
  final String? productAr;

  /// Product name in English language
  /// Secondary product display name for English-speaking users
  @JsonKey(name: 'product_en')
  final String? productEn;

  /// Quantity of the product ordered as string (supports decimal values)
  /// Can contain fractional quantities like "2.5" for weight-based products
  final String? quantity;

  /// Price per unit of the product as string
  /// Stored as string to preserve decimal precision for currency calculations
  final String? price;

  /// Unit measurement information for the product
  /// Contains details about how the product is measured (kg, pieces, boxes, etc.)
  final Unit? unit;

  /// Type of order request (regular, special, urgent, etc.)
  /// Indicates any special handling requirements for this cart item
  @JsonKey(name: 'request_type')
  final String? requestType;

  /// Creates a cart detail instance with product and ordering information
  /// SKU is required as it's the primary product identifier
  /// Other fields are optional to handle various product types and data completeness
  const CartDetail({
    this.skuDynamic,
    this.productAr,
    this.productEn,
    this.quantity,
    this.price,
    this.unit,
    this.requestType,
  });

  /// Factory constructor for creating CartDetail instance from JSON response
  /// Used by the API service to deserialize cart item data from backend
  factory CartDetail.fromJson(final Map<String, dynamic> json) =>
      _$CartDetailFromJson(json);

  /// Converts cart detail instance to JSON for API requests
  /// Used when sending cart item data to the backend or generating reports
  Map<String, dynamic> toJson() => _$CartDetailToJson(this);

  /// Returns the SKU as a string
  String get sku => skuDynamic.toString();
}
