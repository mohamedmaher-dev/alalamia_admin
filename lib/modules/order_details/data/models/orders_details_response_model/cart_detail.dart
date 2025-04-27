import 'package:json_annotation/json_annotation.dart';

import 'unit.dart';

part 'cart_detail.g.dart';

@JsonSerializable()
class CartDetail {
  @JsonKey(name: 'sku')
  final String sku;
  @JsonKey(name: 'product_ar')
  final String? productAr;
  @JsonKey(name: 'product_en')
  final String? productEn;
  final String? quantity;
  final String? price;
  final Unit? unit;
  @JsonKey(name: 'request_type')
  final String? requestType;

  const CartDetail({
    required this.sku,
    this.productAr,
    this.productEn,
    this.quantity,
    this.price,
    this.unit,
    this.requestType,
  });

  factory CartDetail.fromJson(final Map<String, dynamic> json) =>
      _$CartDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CartDetailToJson(this);
}
