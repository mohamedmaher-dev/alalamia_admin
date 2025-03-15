import 'package:alalamia_admin/core/di/di.dart';
import 'package:alalamia_admin/core/extension/order_status_ext.dart';
import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/widgets/error_view.dart';
import 'package:alalamia_admin/core/widgets/loading_view.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/order_status.dart';
import 'package:alalamia_admin/modules/statistics/controllers/statistics/statistics_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
part 'widgets/statistics_slider_item.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<StatisticsCubit>()..getStatistics(),
      child: const _StatisticsBodyView(),
    );
  }
}

class _StatisticsBodyView extends StatelessWidget {
  const _StatisticsBodyView();

  @override
  Widget build(BuildContext context) {
    final language = Language.of(context);
    return Scaffold(
      body: BlocBuilder<StatisticsCubit, StatisticsState>(
        builder: (context, state) {
          return state.maybeMap(
            orElse: () => LoadingView(),
            failure: (e) => ErrorView(),
            success:
                (data) => Column(
                  children: [
                    Expanded(
                      child: _StatSliderItem(
                        showIndicator: false,
                        max: data.orders,
                        title: language.orders,
                        value: data.orders,
                        color: ColorManger.myGold,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: _StatSliderItem(
                              max: data.orders,
                              title: language.status_review,
                              value: data.underReview,
                              color: OrderStatus.requested.orderStatusColor,
                            ),
                          ),
                          Expanded(
                            child: _StatSliderItem(
                              max: data.orders,
                              title: language.status_approved,
                              value: data.approved,
                              color: OrderStatus.received.orderStatusColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: _StatSliderItem(
                              max: data.orders,
                              title: language.status_preparing,
                              value: data.prepareing,
                              color: OrderStatus.repair.orderStatusColor,
                            ),
                          ),
                          Expanded(
                            child: _StatSliderItem(
                              max: data.orders,
                              title: language.status_on_the_way,
                              value: data.onTheWay,
                              color: OrderStatus.deliver.orderStatusColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: _StatSliderItem(
                              max: data.orders,
                              title: language.status_delivered,
                              value: data.delivered,
                              color: OrderStatus.delivered.orderStatusColor,
                            ),
                          ),
                          Expanded(
                            child: _StatSliderItem(
                              max: data.orders,
                              title: language.status_canceled,
                              value: data.cancelled,
                              color: OrderStatus.canceled.orderStatusColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          );
        },
      ),
    );
  }
}
