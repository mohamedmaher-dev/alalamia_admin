import 'package:json_annotation/json_annotation.dart';
part 'change_order_status_request_model.g.dart';

@JsonSerializable(createFactory: false)
class ChangeOrderStatusRequestModel {
  final String status;
  ChangeOrderStatusRequestModel({required this.status});
  Map<String, dynamic> toJson() => _$ChangeOrderStatusRequestModelToJson(this);
}
