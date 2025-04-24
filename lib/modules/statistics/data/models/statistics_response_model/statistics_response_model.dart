import 'package:json_annotation/json_annotation.dart';

import 'chart_labels.dart';
import 'data.dart';

part 'statistics_response_model.g.dart';

@JsonSerializable(createToJson: false)
class StatisticsResponseModel {
  final ChartLabels? chartLabels;
  final int? requests;
  @JsonKey(name: 'request_has_been_approved')
  final int? requestHasBeenApproved;
  @JsonKey(name: 'request_not_approved')
  final int? requestNotApproved;
  @JsonKey(name: 'request_canceled')
  final int? requestCanceled;
  final Data? data;

  const StatisticsResponseModel({
    this.chartLabels,
    this.requests,
    this.requestHasBeenApproved,
    this.requestNotApproved,
    this.requestCanceled,
    this.data,
  });

  factory StatisticsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StatisticsResponseModelFromJson(json);
}
