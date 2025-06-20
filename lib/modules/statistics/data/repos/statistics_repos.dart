import 'package:alalamia_admin/core/data/data_result.dart';
import 'package:alalamia_admin/core/networking/api_service.dart';
import 'package:alalamia_admin/core/networking/api_try_catch.dart';
import 'package:alalamia_admin/modules/statistics/data/models/statistics_response_model/statistics_response_model.dart';

/// Repository for managing statistics and analytics data access
/// Handles fetching business metrics, order statistics, and reporting data
/// Provides data access layer with error handling for analytics functionality
class StatisticsRepos {
  /// API service for statistics network requests
  final ApiService apiService;

  /// Initialize repository with API service dependency
  StatisticsRepos(this.apiService);

  /// Fetch comprehensive statistics and analytics data
  /// Returns DataResult with business metrics including:
  /// - Total orders count
  /// - Orders by status breakdown
  /// - Revenue analytics
  /// - Performance indicators
  /// Used for dashboard analytics and reporting
  Future<DataResult<StatisticsResponseModel>> getStatistics() async =>
      apiTryCatch(apiCall: apiService.getStatistics());
}
