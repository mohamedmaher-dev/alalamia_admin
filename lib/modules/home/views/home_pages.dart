import 'package:alalamia_admin/modules/orders/views/orders_view.dart';
import 'package:alalamia_admin/modules/settings/views/settings_view.dart';
import 'package:alalamia_admin/modules/statistics/views/statistics_view.dart';
import 'package:flutter/material.dart';

enum HomePages {
  statistics(view: StatisticsView(), currentIndex: 0),
  orders(view: OrdersView(), currentIndex: 1),
  settings(view: SettingsView(), currentIndex: 2);

  final Widget view;
  final int currentIndex;
  const HomePages({required this.view, required this.currentIndex});

  static HomePages get defaultPage => HomePages.statistics;
}
