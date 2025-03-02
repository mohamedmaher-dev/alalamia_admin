// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersResponseModel _$OrdersResponseModelFromJson(Map<String, dynamic> json) =>
    OrdersResponseModel(
      orderCounts: (json['tracking_request_count'] as num).toInt(),
      trackingRequests: TrackingRequests.fromJson(
          json['tracking_requests'] as Map<String, dynamic>),
    );

TrackingRequests _$TrackingRequestsFromJson(Map<String, dynamic> json) =>
    TrackingRequests(
      orderItems: (json['data'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: json['current_page'] as String,
    );

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      orderId: (json['id'] as num).toInt(),
      requestNumber: json['request_number'] as String,
      isActive: (json['is_active'] as num).toInt(),
      orderDate: json['booking_date'] as String,
      cart: Cart.fromJson(json['request_items'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : ClientAddress.fromJson(json['address'] as Map<String, dynamic>),
    );

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      priceSum: (json['price_sum'] as num).toInt(),
      items: (json['cart_product_items'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: Client.fromJson(json['user'] as Map<String, dynamic>),
    );

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      itemPrice: json['price'] as String,
      orderAvailability: (json['order_availability'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      productName: json['productName'] as String,
      pivot: Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
    );

Pivot _$PivotFromJson(Map<String, dynamic> json) => Pivot(
      quantity: json['quantity'] as String,
    );

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      id: (json['id'] as num).toInt(),
      name: json['full_name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      fcm: json['fcm'] as String,
      wallet: ClientWallet.fromJson(json['wallet'] as Map<String, dynamic>),
      imagePath: json['image_path'] as String?,
    );

ClientAddress _$ClientAddressFromJson(Map<String, dynamic> json) =>
    ClientAddress(
      addressName: json['name'] as String,
      addressDesc: json['desc'] as String,
      lat: json['lat'] as String,
      lng: json['long'] as String,
    );

ClientWallet _$ClientWalletFromJson(Map<String, dynamic> json) => ClientWallet(
      currencyName: json['currency_name'] as String,
    );
