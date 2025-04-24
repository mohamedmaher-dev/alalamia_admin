import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/order_status.dart';
import 'package:alalamia_admin/modules/orders/data/rebos/orders_rebo.dart';
import 'package:alalamia_admin/modules/statistics/data/rebos/statistics_rebos.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics_state.dart';
part 'statistics_cubit.freezed.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  final StatisticsRebos statisticsRebos;
  final OrdersRebo ordersRebo;
  StatisticsCubit(this.statisticsRebos, this.ordersRebo)
    : super(const StatisticsState.initial());

  // // Get Normal Orders
  // Future<void> getStatistics() async {
  //   emit(StatisticsState.loading());
  //   final result = await statisticsRebos.getStatistics();
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
      final result = await ordersRebo.getOrdersWithApiResult(currentPage);
      result.when(
        success: (data) {
          orders.addAll(data.trackingRequests.data);
          currentPage = data.trackingRequests.currentPage;
          final int total = data.trackingRequests.total;
          final int perPage = data.trackingRequests.perPage;
          isLastPage = (perPage * currentPage) >= total;
          if (!isLastPage) currentPage++;
        },
        failure: (error) {
          isLastPage = true;
          emit(const StatisticsState.failure());
        },
      );
    }
    if (orders.isNotEmpty) {
      emit(
        StatisticsState.success(
          orders: orders.length,
          underReview:
              orders
                  .where((element) => element.status == OrderStatus.requested)
                  .length,
          approved:
              orders
                  .where((element) => element.status == OrderStatus.received)
                  .length,
          prepareing:
              orders
                  .where((element) => element.status == OrderStatus.repair)
                  .length,
          onTheWay:
              orders
                  .where((element) => element.status == OrderStatus.deliver)
                  .length,
          delivered:
              orders
                  .where((element) => element.status == OrderStatus.delivered)
                  .length,
          cancelled:
              orders
                  .where((element) => element.status == OrderStatus.canceled)
                  .length,
        ),
      );
    } else {
      emit(const StatisticsState.failure());
    }
  }
}
