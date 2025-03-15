import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'cart_detail.dart';

part 'orders_details_response_model.g.dart';

@JsonSerializable()
class OrdersDetailsResponseModel {
  @JsonKey(name: 'user_name')
  final String? userName;
  @JsonKey(name: 'request_no')
  final String? requestNo;
  @JsonKey(name: 'cart_detail')
  final List<CartDetail>? cartDetail;
  final int? sum;
  @JsonKey(name: 'price_sum')
  final double? priceSum;
  final dynamic coupon;
  @JsonKey(name: 'remaining_amount')
  final dynamic remainingAmount;
  @JsonKey(name: 'receiving_type')
  final String? receivingType;
  final Address? address;
  final String? desc;
  @JsonKey(name: 'cancel_note')
  final String? cancelNote;
  final dynamic hospitality;
  @JsonKey(name: 'payment_type')
  final String? paymentType;
  @JsonKey(name: 'cache_payment')
  final String? cachePayment;
  final String? branch;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'created_at_diffForHumans')
  final String? createdAtDiffForHumans;

  const OrdersDetailsResponseModel({
    this.userName,
    this.requestNo,
    this.cartDetail,
    this.sum,
    this.priceSum,
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

  factory OrdersDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$OrdersDetailsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrdersDetailsResponseModelToJson(this);
}
