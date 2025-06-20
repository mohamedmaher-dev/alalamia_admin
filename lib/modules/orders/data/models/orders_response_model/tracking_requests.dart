import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'tracking_requests.g.dart';

/// Tracking requests model containing paginated orders data from the API
/// Provides pagination metadata and order data for list views
/// Used for managing order list display with infinite scroll functionality
@JsonSerializable(createToJson: false)
class TrackingRequests {
  /// Current page number in the pagination sequence
  /// Used for tracking scroll position and loading next page data
  @JsonKey(name: 'current_page')
  final int currentPage;

  /// Number of orders per page as defined by the backend
  /// Used for calculating pagination logic and load more functionality
  @JsonKey(name: 'per_page')
  final int perPage;

  /// Total number of orders available across all pages
  /// Used for showing total count and determining if more data exists
  final int total;

  /// List of order data objects for the current page
  /// Contains detailed order information for display in the orders list
  final List<OrdersDatum> data;

  /// Creates a tracking requests instance with pagination data and orders
  /// All parameters are required as they're essential for proper pagination
  const TrackingRequests({
    required this.currentPage,
    required this.perPage,
    required this.total,
    required this.data,
  });

  /// Factory constructor for creating TrackingRequests from JSON response
  /// Used by the API service to deserialize paginated orders data from backend
  factory TrackingRequests.fromJson(final Map<String, dynamic> json) =>
      _$TrackingRequestsFromJson(json);
}
