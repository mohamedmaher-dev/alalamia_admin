import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_tab_state.dart';
part 'orders_tab_cubit.freezed.dart';

class OrdersTabCubit extends Cubit<OrdersTabState> {
  OrdersTabCubit() : super(OrdersTabState.newTab(index: 0));
  void changeTab(int index) => emit(OrdersTabState.newTab(index: index));
}
