import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable(createToJson: false)
class Data {
  @JsonKey(name: 'Requests')
  final List<List<int>>? requests;
  @JsonKey(name: 'Approved')
  final List<List<int>>? approved;
  @JsonKey(name: 'Not Approved')
  final List<List<int>>? notApproved;
  @JsonKey(name: 'Canceled')
  final List<List<int>>? canceled;
  @JsonKey(name: 'Special')
  final List<List<int>>? special;

  const Data({
    this.requests,
    this.approved,
    this.notApproved,
    this.canceled,
    this.special,
  });

  factory Data.fromJson(final Map<String, dynamic> json) =>
      _$DataFromJson(json);
}
