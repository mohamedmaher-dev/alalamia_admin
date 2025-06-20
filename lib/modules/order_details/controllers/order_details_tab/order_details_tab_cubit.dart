import 'package:alalamia_admin/modules/order_details/views/one_order_view.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_details_tab_state.dart';
part 'order_details_tab_cubit.freezed.dart';

/// Cubit for managing tab navigation within order details screen
/// Handles switching between different sections like General, Cart, and Bottom info
/// Controls PageView navigation and maintains current tab state
class OrderDetailsTabCubit extends Cubit<OrderDetailsTabState> {
  /// Page controller for managing PageView navigation between tabs
  /// Starts at the default tab index defined by OrderDetailsTabsModel
  final PageController pageController = PageController(
    initialPage: OrderDetailsTabsModel.defaultTab.index,
  );

  /// Initialize cubit with the default tab state
  OrderDetailsTabCubit()
    : super(OrderDetailsTabState.change(tab: OrderDetailsTabsModel.defaultTab));

  /// Change to a different tab within order details
  /// [tab] - The target tab to navigate to
  /// Updates both the PageView and the state to reflect the new tab
  void changeTab(final OrderDetailsTabsModel tab) {
    // Jump to the selected tab's page
    pageController.jumpToPage(tab.index);
    // Update state to reflect the current tab
    emit(OrderDetailsTabState.change(tab: tab));
  }
}
