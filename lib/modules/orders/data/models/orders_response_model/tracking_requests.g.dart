// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackingRequests _$TrackingRequestsFromJson(Map<String, dynamic> json) =>
    TrackingRequests(
      currentPage: (json['current_page'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => OrdersDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
