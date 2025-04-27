// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartDetail _$CartDetailFromJson(Map<String, dynamic> json) => CartDetail(
  sku: json['sku'] as String,
  productAr: json['product_ar'] as String?,
  productEn: json['product_en'] as String?,
  quantity: json['quantity'] as String?,
  price: json['price'] as String?,
  unit:
      json['unit'] == null
          ? null
          : Unit.fromJson(json['unit'] as Map<String, dynamic>),
  requestType: json['request_type'] as String?,
);

Map<String, dynamic> _$CartDetailToJson(CartDetail instance) =>
    <String, dynamic>{
      'sku': instance.sku,
      'product_ar': instance.productAr,
      'product_en': instance.productEn,
      'quantity': instance.quantity,
      'price': instance.price,
      'unit': instance.unit,
      'request_type': instance.requestType,
    };
