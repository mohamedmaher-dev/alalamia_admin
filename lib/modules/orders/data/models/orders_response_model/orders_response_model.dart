import 'package:json_annotation/json_annotation.dart';

import 'tracking_requests.dart';

part 'orders_response_model.g.dart';

@JsonSerializable(createToJson: false)
class OrdersResponseModel {
  @JsonKey(name: 'tracking_requests')
  final TrackingRequests trackingRequests;

  const OrdersResponseModel({required this.trackingRequests});

  factory OrdersResponseModel.fromJson(final Map<String, dynamic> json) =>
      _$OrdersResponseModelFromJson(json);
}
