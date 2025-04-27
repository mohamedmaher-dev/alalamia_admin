// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersDetailsResponseModel _$OrdersDetailsResponseModelFromJson(
  Map<String, dynamic> json,
) => OrdersDetailsResponseModel(
  userName: json['user_name'] as String?,
  requestNo: json['request_no'] as String?,
  cartDetail:
      (json['cart_detail'] as List<dynamic>?)
          ?.map((e) => CartDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
  sum: (json['sum'] as num?)?.toInt(),
  priceSum: (json['price_sum'] as num?)?.toDouble(),
  coupon: json['coupon'],
  remainingAmount: json['remaining_amount'],
  receivingType: json['receiving_type'] as String?,
  address:
      json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
  desc: json['desc'] as String?,
  cancelNote: json['cancel_note'] as String?,
  hospitality: json['hospitality'],
  paymentType: json['payment_type'] as String?,
  cachePayment: json['cache_payment'] as String?,
  branch: json['branch'] as String?,
  createdAt: json['created_at'] as String?,
  createdAtDiffForHumans: json['created_at_diffForHumans'] as String?,
);

Map<String, dynamic> _$OrdersDetailsResponseModelToJson(
  OrdersDetailsResponseModel instance,
) => <String, dynamic>{
  'user_name': instance.userName,
  'request_no': instance.requestNo,
  'cart_detail': instance.cartDetail,
  'sum': instance.sum,
  'price_sum': instance.priceSum,
  'coupon': instance.coupon,
  'remaining_amount': instance.remainingAmount,
  'receiving_type': instance.receivingType,
  'address': instance.address,
  'desc': instance.desc,
  'cancel_note': instance.cancelNote,
  'hospitality': instance.hospitality,
  'payment_type': instance.paymentType,
  'cache_payment': instance.cachePayment,
  'branch': instance.branch,
  'created_at': instance.createdAt,
  'created_at_diffForHumans': instance.createdAtDiffForHumans,
};
