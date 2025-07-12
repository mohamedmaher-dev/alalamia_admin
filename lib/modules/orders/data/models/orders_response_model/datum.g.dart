// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersDatum _$OrdersDatumFromJson(Map<String, dynamic> json) => OrdersDatum(
  id: (json['id'] as num).toInt(),
  userName: json['user_name'] as String,
  phone: json['phone'] as String,
  requestNumber: json['request_number'] as String,
  aramexId: (json['aramex_id'] as num?)?.toInt(),
  countryModel: $enumDecodeNullable(_$CountryModelEnumMap, json['country_id']),
  paymentType: $enumDecode(_$OrderPaymentTypeEnumMap, json['payment_type']),
  status: $enumDecode(_$OrderStatusEnumMap, json['status']),
  bookingDate: json['booking_date'] as String,
  createdAt: json['created_at'] as String,
);

const _$CountryModelEnumMap = {
  CountryModel.global: '0',
  CountryModel.uae: 2,
  CountryModel.ksa: 3,
};

const _$OrderPaymentTypeEnumMap = {
  OrderPaymentType.alalmiaWallet: 'Alalmia Wallet',
  OrderPaymentType.cash: 'Cash',
  OrderPaymentType.paypal: 'PayPal',
  OrderPaymentType.card: 'Card',
};

const _$OrderStatusEnumMap = {
  OrderStatus.requested: 'requested',
  OrderStatus.repair: 'repair',
  OrderStatus.delivered: 'delivered',
  OrderStatus.deliver: 'deliver',
  OrderStatus.reviewed: 'reviewed',
  OrderStatus.canceled: 'canceled',
  OrderStatus.received: 'received',
  OrderStatus.done: 'done',
  OrderStatus.completedRequest: 'completedRequest',
  OrderStatus.onTheWay: 'on_the_way',
  OrderStatus.onBranch: 'on_branch',
  OrderStatus.external: 'external',
};
