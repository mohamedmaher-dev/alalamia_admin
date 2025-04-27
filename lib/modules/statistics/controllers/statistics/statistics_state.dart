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
    required final int orders,
    required final int underReview,
    required final int approved,
    required final int prepareing,
    required final int onTheWay,
    required final int delivered,
    required final int cancelled,
  }) = _Success;
}
