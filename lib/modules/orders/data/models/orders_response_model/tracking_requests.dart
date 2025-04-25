import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'tracking_requests.g.dart';

@JsonSerializable(createToJson: false)
class TrackingRequests {
  @JsonKey(name: 'current_page')
  final int currentPage;
  @JsonKey(name: 'per_page')
  final int perPage;
  final int total;
  final List<OrdersDatum> data;

  const TrackingRequests({
    required this.currentPage,
    required this.perPage,
    required this.total,
    required this.data,
  });

  factory TrackingRequests.fromJson(final Map<String, dynamic> json) =>
      _$TrackingRequestsFromJson(json);
}
