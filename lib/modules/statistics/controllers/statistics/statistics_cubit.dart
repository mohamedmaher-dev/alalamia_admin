import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/order_status.dart';
import 'package:alalamia_admin/modules/orders/data/repos/orders_repo.dart';
import 'package:alalamia_admin/modules/statistics/data/repos/statistics_repos.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics_state.dart';
part 'statistics_cubit.freezed.dart';

/// Cubit for managing statistics and analytics data
/// Fetches all orders and calculates statistics based on order status
/// Provides insights into order distribution and business metrics
class StatisticsCubit extends Cubit<StatisticsState> {
  /// Repository for statistics API endpoints
  final StatisticsRepos statisticsRepos;

  /// Repository for orders data access
  final OrdersRepo ordersRepo;

  /// Initialize cubit with required repository dependencies
  StatisticsCubit(this.statisticsRepos, this.ordersRepo)
    : super(const StatisticsState.initial());

  // Alternative implementation using dedicated statistics API
  // Currently commented out in favor of calculating from orders data
  //
  // /// Get statistics from dedicated statistics endpoint
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

  /// Fetch all orders and calculate statistics by status
  /// Iterates through all pages to get complete dataset for accurate statistics
  Future<void> getStatistics() async {
    // List to store all orders from all pages
    // ignore: prefer_final_locals
    List<OrdersDatum> orders = [];

    // Emit loading state while fetching data
    emit(const StatisticsState.loading());

    // Pagination variables for fetching all orders
    int currentPage = 1;
    bool isLastPage = false;

    // Fetch all orders by iterating through all pages
    while (!isLastPage) {
      final result = await ordersRepo.getOrdersWithApiResult(currentPage);
      result.when(
        success: (final data) {
          // Add current page orders to the complete list
          orders.addAll(data.trackingRequests.data);
          currentPage = data.trackingRequests.currentPage;
          final int total = data.trackingRequests.total;
          final int perPage = data.trackingRequests.perPage;

          // Check if this is the last page
          isLastPage = (perPage * currentPage) >= total;
          if (!isLastPage) currentPage++;
        },
        failure: (final error) {
          // Stop pagination on error and emit failure state
          isLastPage = true;
          if (!isClosed) emit(const StatisticsState.failure());
        },
      );
    }

    // Calculate statistics if orders were fetched successfully
    if (orders.isNotEmpty && !isClosed) {
      emit(
        StatisticsState.success(
          // Total number of orders
          orders: orders.length,

          // Count orders under review (requested status)
          underReview:
              orders
                  .where(
                    (final element) => element.status == OrderStatus.requested,
                  )
                  .length,

          // Count approved orders (received status)
          approved:
              orders
                  .where(
                    (final element) => element.status == OrderStatus.received,
                  )
                  .length,

          // Count orders being prepared (repair status)
          prepareing:
              orders
                  .where(
                    (final element) => element.status == OrderStatus.repair,
                  )
                  .length,

          // Count orders on the way (deliver status)
          onTheWay:
              orders
                  .where(
                    (final element) => element.status == OrderStatus.deliver,
                  )
                  .length,

          // Count delivered orders
          delivered:
              orders
                  .where(
                    (final element) => element.status == OrderStatus.delivered,
                  )
                  .length,

          // Count cancelled orders
          cancelled:
              orders
                  .where(
                    (final element) => element.status == OrderStatus.canceled,
                  )
                  .length,
        ),
      );
    } else {
      // Emit failure state if no orders found or if cubit is closed
      if (!isClosed) emit(const StatisticsState.failure());
    }
  }
}
