part of 'statistics_cubit.dart';

@freezed
class StatisticsState with _$StatisticsState {
  const factory StatisticsState.initial() = _Initial;
  const factory StatisticsState.loading() = _Loading;
  // const factory StatisticsState.success({
  //   required StatisticsResponseModel data,
  // }) = _Success;
  const factory StatisticsState.failure() = _Failure;
  const factory StatisticsState.success({
    required int orders,
    required int underReview,
    required int approved,
    required int prepareing,
    required int onTheWay,
    required int delivered,
    required int cancelled,
  }) = _Success;
}
