import 'package:alalamia_admin/modules/order_details/views/one_order_view.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_details_tab_state.dart';
part 'order_details_tab_cubit.freezed.dart';

class OrderDetailsTabCubit extends Cubit<OrderDetailsTabState> {
  final PageController pageController = PageController(
    initialPage: OrderDetailsTabsModel.defaultTab.index,
  );
  OrderDetailsTabCubit()
    : super(OrderDetailsTabState.change(tab: OrderDetailsTabsModel.defaultTab));

  void changeTab(OrderDetailsTabsModel tab) {
    pageController.jumpToPage(tab.index);
    emit(OrderDetailsTabState.change(tab: tab));
  }
}
