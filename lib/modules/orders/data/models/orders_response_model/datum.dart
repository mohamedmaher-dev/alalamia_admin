import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/order_payment_type.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/order_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable(createToJson: false)
class OrdersDatum {
  final int id;
  @JsonKey(name: 'user_name')
  final String userName;
  final String phone;
  @JsonKey(name: 'request_number')
  final String requestNumber;
  @JsonKey(name: 'payment_type')
  final OrderPaymentType paymentType;
  final OrderStatus status;
  @JsonKey(name: 'booking_date')
  final String bookingDate;
  @JsonKey(name: 'created_at')
  final String createdAt;

  const OrdersDatum({
    required this.id,
    required this.userName,
    required this.phone,
    required this.requestNumber,
    required this.paymentType,
    required this.status,
    required this.bookingDate,
    required this.createdAt,
  });

  factory OrdersDatum.fromJson(Map<String, dynamic> json) =>
      _$OrdersDatumFromJson(json);

  String get currency => phone.contains('+966') ? 'SAR' : 'AED';
}
