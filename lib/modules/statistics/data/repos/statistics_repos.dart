import 'package:alalamia_admin/core/data/data_result.dart';
import 'package:alalamia_admin/core/networking/api_service.dart';
import 'package:alalamia_admin/core/networking/api_try_catch.dart';
import 'package:alalamia_admin/modules/statistics/data/models/statistics_response_model/statistics_response_model.dart';

class StatisticsRepos {
  final ApiService apiService;

  StatisticsRepos(this.apiService);

  Future<DataResult<StatisticsResponseModel>> getStatistics() async =>
      apiTryCatch(apiCall: apiService.getStatistics());
}
