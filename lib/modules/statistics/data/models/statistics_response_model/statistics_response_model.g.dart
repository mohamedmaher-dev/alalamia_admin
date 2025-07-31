// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatisticsResponseModel _$StatisticsResponseModelFromJson(
  Map<String, dynamic> json,
) => StatisticsResponseModel(
  chartLabels: json['chartLabels'] == null
      ? null
      : ChartLabels.fromJson(json['chartLabels'] as Map<String, dynamic>),
  requests: (json['requests'] as num?)?.toInt(),
  requestHasBeenApproved: (json['request_has_been_approved'] as num?)?.toInt(),
  requestNotApproved: (json['request_not_approved'] as num?)?.toInt(),
  requestCanceled: (json['request_canceled'] as num?)?.toInt(),
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);
