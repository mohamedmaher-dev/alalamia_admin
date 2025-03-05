import 'package:alalamia_admin/modules/orders/data/models/orders/orders_response_model.dart';
import 'package:alalamia_admin/modules/orders/data/rebos/orders_rebo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
part 'orders_state.dart';
part 'orders_cubit.freezed.dart';

class OrdersCubit extends Cubit<OrdersState> {
  late final pagingController = PagingController<int, OrderItem>(
    getNextPageKey: (state) => _getNextPageKey(state),
    fetchPage: (pageKey) => _getOrders(pageKey),
  );
  final OrdersRebo ordersRebo;
  OrdersCubit(this.ordersRebo) : super(OrdersState.initial());

  int? _getNextPageKey(PagingState<int, OrderItem> state) {
    if (state.pages == null) {
      return 1;
    } else {
      if (state.pages!.last.isEmpty) {
        return null;
      } else {
        return state.keys!.last + 1;
      }
    }
  }

  Future<List<OrderItem>> _getOrders(int page) async {
    final result = await ordersRebo.getOrders(page);
    return result.trackingRequests.orderItems;
  }

  @override
  Future<void> close() {
    pagingController.dispose();
    return super.close();
  }
}
