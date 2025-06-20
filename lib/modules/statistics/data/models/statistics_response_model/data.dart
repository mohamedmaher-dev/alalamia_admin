import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

/// Statistics data model containing order counts by status over time periods
/// Represents numerical data for analytics charts and dashboard displays
/// Used for visualizing business metrics and order distribution trends
@JsonSerializable(createToJson: false)
class Data {
  /// List of request counts organized by time periods (e.g., daily, weekly)
  /// Represents new order requests received in each time period
  @JsonKey(name: 'Requests')
  final List<List<int>>? requests;

  /// List of approved order counts organized by time periods
  /// Represents successfully approved orders in each time period
  @JsonKey(name: 'Approved')
  final List<List<int>>? approved;

  /// List of not approved/rejected order counts organized by time periods
  /// Represents orders that were declined or rejected in each time period
  @JsonKey(name: 'Not Approved')
  final List<List<int>>? notApproved;

  /// List of canceled order counts organized by time periods
  /// Represents orders that were canceled (by admin or customer) in each time period
  @JsonKey(name: 'Canceled')
  final List<List<int>>? canceled;

  /// List of special order counts organized by time periods
  /// Represents orders with special handling or priority in each time period
  @JsonKey(name: 'Special')
  final List<List<int>>? special;

  /// Creates a statistics data instance with order count arrays
  /// All parameters are optional as different endpoints may provide different data sets
  const Data({
    this.requests,
    this.approved,
    this.notApproved,
    this.canceled,
    this.special,
  });

  /// Factory constructor for creating Data instance from JSON response
  /// Used by the API service to deserialize statistics data from backend
  factory Data.fromJson(final Map<String, dynamic> json) =>
      _$DataFromJson(json);
}
