import 'package:json_annotation/json_annotation.dart';

import 'chart_labels.dart';
import 'data.dart';

part 'statistics_response_model.g.dart';

/// Main statistics response model containing order analytics and chart data
/// Represents complete statistics data received from the backend API
/// Used for displaying business metrics, charts, and dashboard analytics
@JsonSerializable(createToJson: false)
class StatisticsResponseModel {
  /// Chart labels containing localized day names for graph visualization
  /// Used to display proper day labels in chart axes based on user language
  final ChartLabels? chartLabels;

  /// Total number of order requests received
  /// Represents overall order volume for summary displays
  final int? requests;

  /// Total number of approved orders
  /// Used for showing successful order approval metrics
  @JsonKey(name: 'request_has_been_approved')
  final int? requestHasBeenApproved;

  /// Total number of not approved/rejected orders
  /// Used for tracking order rejection rates and admin performance
  @JsonKey(name: 'request_not_approved')
  final int? requestNotApproved;

  /// Total number of canceled orders
  /// Used for monitoring order cancellation trends and customer behavior
  @JsonKey(name: 'request_canceled')
  final int? requestCanceled;

  /// Time-series data containing order counts by status over periods
  /// Used for generating charts and trend analysis graphs
  final Data? data;

  /// Creates a statistics response instance with all analytics data
  /// All parameters are optional to handle various API response formats
  const StatisticsResponseModel({
    this.chartLabels,
    this.requests,
    this.requestHasBeenApproved,
    this.requestNotApproved,
    this.requestCanceled,
    this.data,
  });

  /// Factory constructor for creating StatisticsResponseModel from JSON response
  /// Used by the API service to deserialize complete statistics data from backend
  factory StatisticsResponseModel.fromJson(final Map<String, dynamic> json) =>
      _$StatisticsResponseModelFromJson(json);
}
