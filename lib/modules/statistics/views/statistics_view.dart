import 'package:alalamia_admin/core/di/di.dart';
import 'package:alalamia_admin/core/extension/order_status_ext.dart';
import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/widgets/error_view.dart';
import 'package:alalamia_admin/core/widgets/loading_view.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/order_status.dart';
import 'package:alalamia_admin/modules/statistics/controllers/statistics/statistics_cubit.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

// Import statistics-specific widgets
part 'widgets/statistics_slider_item.dart';

/// Statistics and analytics screen displaying order metrics and insights
/// Shows total orders count and breakdown by status using visual gauges
/// Part of the main bottom navigation tab structure
@RoutePage()
class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});

  @override
  Widget build(final BuildContext context) => BlocProvider(
    // Create statistics cubit and automatically start fetching data
    create: (final context) => di<StatisticsCubit>()..getStatistics(),
    child: const _StatisticsBodyView(),
  );
}

/// Private body widget containing the statistics dashboard content
class _StatisticsBodyView extends StatelessWidget {
  const _StatisticsBodyView();

  @override
  Widget build(final BuildContext context) {
    final language = Language.of(context);
    return BlocBuilder<StatisticsCubit, StatisticsState>(
      builder:
          (final context, final state) => state.maybeMap(
            // Show loading indicator while fetching statistics
            orElse: () => const LoadingView(),
            // Show error view if statistics fetch fails
            failure: (final e) => const ErrorView(),
            // Show statistics dashboard when data is loaded successfully
            success:
                (final data) => RefreshIndicator(
                  strokeWidth: 1,
                  // Refresh statistics data when user pulls down
                  onRefresh:
                      () async =>
                          await context.read<StatisticsCubit>().getStatistics(),
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        child: Column(
                          children: [
                            // Total orders count at the top
                            Expanded(
                              child: _StatSliderItem(
                                showIndicator: false,
                                max: data.orders,
                                title: language.orders,
                                value: data.orders,
                                color: ColorManger.myGold,
                              ),
                            ),
                            // First row: Under Review and Approved orders
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: _StatSliderItem(
                                      max: data.orders,
                                      title: language.status_review,
                                      value: data.underReview,
                                      color:
                                          OrderStatus
                                              .requested
                                              .orderStatusColor,
                                    ),
                                  ),
                                  Expanded(
                                    child: _StatSliderItem(
                                      max: data.orders,
                                      title: language.status_approved,
                                      value: data.approved,
                                      color:
                                          OrderStatus.received.orderStatusColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Second row: Preparing and On The Way orders
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: _StatSliderItem(
                                      max: data.orders,
                                      title: language.status_preparing,
                                      value: data.prepareing,
                                      color:
                                          OrderStatus.repair.orderStatusColor,
                                    ),
                                  ),
                                  Expanded(
                                    child: _StatSliderItem(
                                      max: data.orders,
                                      title: language.status_on_the_way,
                                      value: data.onTheWay,
                                      color:
                                          OrderStatus.deliver.orderStatusColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Third row: Delivered and Cancelled orders
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: _StatSliderItem(
                                      max: data.orders,
                                      title: language.status_delivered,
                                      value: data.delivered,
                                      color:
                                          OrderStatus
                                              .delivered
                                              .orderStatusColor,
                                    ),
                                  ),
                                  Expanded(
                                    child: _StatSliderItem(
                                      max: data.orders,
                                      title: language.status_canceled,
                                      value: data.cancelled,
                                      color:
                                          OrderStatus.canceled.orderStatusColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
          ),
    );
  }
}
