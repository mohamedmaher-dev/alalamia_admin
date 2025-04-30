import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/order_status.dart';
import 'package:alalamia_admin/modules/orders/data/repos/orders_repo.dart';
import 'package:alalamia_admin/modules/statistics/data/repos/statistics_repos.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics_state.dart';
part 'statistics_cubit.freezed.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  final StatisticsRepos statisticsRepos;
  final OrdersRepo ordersRepo;
  StatisticsCubit(this.statisticsRepos, this.ordersRepo)
    : super(const StatisticsState.initial());

  // // Get Normal Orders
  // Future<void> getStatistics() async {
  //   emit(StatisticsState.loading());
  //   final result = await statisticsRepos.getStatistics();
  //   result.when(
  //     success: (data) {
  //       emit(StatisticsState.success(data: data));
  //     },
  //     failure: (error) {
  //       emit(StatisticsState.failure());
  //     },
  //   );
  // }

  Future<void> getStatistics() async {
    // ignore: prefer_final_locals
    List<OrdersDatum> orders = [];
    emit(const StatisticsState.loading());
    int currentPage = 1;
    bool isLastPage = false;
    while (!isLastPage) {
      final result = await ordersRepo.getOrdersWithApiResult(currentPage);
      result.when(
        success: (final data) {
          orders.addAll(data.trackingRequests.data);
          currentPage = data.trackingRequests.currentPage;
          final int total = data.trackingRequests.total;
          final int perPage = data.trackingRequests.perPage;
          isLastPage = (perPage * currentPage) >= total;
          if (!isLastPage) currentPage++;
        },
        failure: (final error) {
          isLastPage = true;
          if (!isClosed) emit(const StatisticsState.failure());
        },
      );
    }
    if (orders.isNotEmpty && !isClosed) {
      emit(
        StatisticsState.success(
          orders: orders.length,
          underReview:
              orders
                  .where(
                    (final element) => element.status == OrderStatus.requested,
                  )
                  .length,
          approved:
              orders
                  .where(
                    (final element) => element.status == OrderStatus.received,
                  )
                  .length,
          prepareing:
              orders
                  .where(
                    (final element) => element.status == OrderStatus.repair,
                  )
                  .length,
          onTheWay:
              orders
                  .where(
                    (final element) => element.status == OrderStatus.deliver,
                  )
                  .length,
          delivered:
              orders
                  .where(
                    (final element) => element.status == OrderStatus.delivered,
                  )
                  .length,
          cancelled:
              orders
                  .where(
                    (final element) => element.status == OrderStatus.canceled,
                  )
                  .length,
        ),
      );
    } else {
      if (!isClosed) emit(const StatisticsState.failure());
    }
  }
}
