import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart';
import 'package:alalamia_admin/modules/orders/data/repos/orders_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
part 'orders_state.dart';
part 'orders_cubit.freezed.dart';

/// Cubit for managing orders list with infinite scroll pagination
/// Handles fetching, displaying, and paginating through orders data
class OrdersCubit extends Cubit<OrdersState> {
  /// Pagination controller for infinite scroll functionality
  /// Automatically handles loading more orders as user scrolls
  late final pagingController = PagingController<int, OrdersDatum>(
    getNextPageKey: (final state) => _getNextPageKey(state),
    fetchPage: (final pageKey) => _getOrders(pageKey),
  );

  /// Repository for orders data access
  final OrdersRepo ordersRepo;

  /// Initialize the cubit with orders repository dependency
  OrdersCubit(this.ordersRepo) : super(const OrdersState.initial());

  /// Determine the next page key for pagination
  /// [state] - Current pagination state containing pages and keys
  /// Returns the next page number to fetch, or null if no more pages
  int? _getNextPageKey(final PagingState<int, OrdersDatum> state) {
    // If no pages loaded yet, start with page 1
    if (state.pages == null) {
      return 1;
    } else {
      // If last page is empty, no more pages available
      if (state.pages!.last.isEmpty) {
        return null;
      } else {
        // Return next page number (increment current page)
        return state.keys!.last + 1;
      }
    }
  }

  /// Fetch orders for a specific page
  /// [page] - Page number to fetch (starts from 1)
  /// Returns list of order data for the requested page
  Future<List<OrdersDatum>> _getOrders(final int page) async {
    // Fetch orders from repository for the specified page
    final result = await ordersRepo.getOrders(page);
    // Return the data array from the tracking requests response
    return result.trackingRequests.data;
  }

  /// Clean up resources when cubit is closed
  /// Disposes the pagination controller to prevent memory leaks
  @override
  Future<void> close() {
    pagingController.dispose();
    return super.close();
  }
}
