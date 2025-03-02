import 'package:json_annotation/json_annotation.dart';
part 'orders_response_model.g.dart';

@JsonSerializable(createToJson: false)
class OrdersResponseModel {
  @JsonKey(name: 'tracking_request_count')
  final int orderCounts;
  @JsonKey(name: 'tracking_requests')
  final TrackingRequests trackingRequests;

  const OrdersResponseModel({
    required this.orderCounts,
    required this.trackingRequests,
  });
  factory OrdersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersResponseModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class TrackingRequests {
  @JsonKey(name: 'current_page')
  final String currentPage;
  @JsonKey(name: 'data')
  final List<OrderItem> orderItems;
  const TrackingRequests({required this.orderItems, required this.currentPage});
  factory TrackingRequests.fromJson(Map<String, dynamic> json) =>
      _$TrackingRequestsFromJson(json);
}

@JsonSerializable(createToJson: false)
class OrderItem {
  @JsonKey(name: 'id')
  final int orderId;
  @JsonKey(name: 'request_number')
  final String requestNumber;
  @JsonKey(name: 'is_active')
  final int isActive;
  @JsonKey(name: 'booking_date')
  final String orderDate;
  @JsonKey(name: 'request_items')
  final Cart cart;
  @JsonKey(name: 'address')
  final ClientAddress? address;

  const OrderItem({
    required this.orderId,
    required this.requestNumber,
    required this.isActive,
    required this.orderDate,
    required this.cart,
    required this.address,
  });
  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class Cart {
  @JsonKey(name: 'price_sum')
  final int priceSum;
  @JsonKey(name: 'cart_product_items')
  final List<CartItem> items;
  @JsonKey(name: 'user')
  final Client user;
  const Cart({required this.priceSum, required this.items, required this.user});
  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@JsonSerializable(createToJson: false)
class CartItem {
  @JsonKey(name: 'price')
  final String itemPrice;
  @JsonKey(name: 'order_availability')
  final int orderAvailability;
  @JsonKey(name: 'product_id')
  final int productId;
  @JsonKey(name: 'productName')
  final String productName;
  @JsonKey(name: 'pivot')
  final Pivot pivot;
  const CartItem({
    required this.itemPrice,
    required this.orderAvailability,
    required this.productId,
    required this.productName,
    required this.pivot,
  });
  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class Pivot {
  @JsonKey(name: 'quantity')
  final String quantity;
  const Pivot({required this.quantity});
  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);
}

@JsonSerializable(createToJson: false)
class Client {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'full_name')
  final String name;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'phone')
  final String phone;
  @JsonKey(name: 'fcm')
  final String fcm;
  @JsonKey(name: 'image_path')
  final String? imagePath;
  @JsonKey(name: 'wallet')
  final ClientWallet wallet;
  const Client({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.fcm,
    required this.wallet,
    this.imagePath,
  });
  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}

@JsonSerializable(createToJson: false)
class ClientAddress {
  @JsonKey(name: 'name')
  final String addressName;
  @JsonKey(name: 'desc')
  final String addressDesc;
  @JsonKey(name: 'lat')
  final String lat;
  @JsonKey(name: 'long')
  final String lng;
  const ClientAddress({
    required this.addressName,
    required this.addressDesc,
    required this.lat,
    required this.lng,
  });
  factory ClientAddress.fromJson(Map<String, dynamic> json) =>
      _$ClientAddressFromJson(json);
}

@JsonSerializable(createToJson: false)
class ClientWallet {
  @JsonKey(name: 'currency_name')
  final String currencyName;
  const ClientWallet({required this.currencyName});
  factory ClientWallet.fromJson(Map<String, dynamic> json) =>
      _$ClientWalletFromJson(json);
}
