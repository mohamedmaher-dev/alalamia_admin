import 'package:alalamia_admin/core/di/di.dart';
import 'package:alalamia_admin/core/extension/order_payment_type.dart';
import 'package:alalamia_admin/core/extension/order_status_ext.dart';
import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/router/app_router.gr.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:alalamia_admin/core/widgets/custom_list_tile.dart';
import 'package:alalamia_admin/core/widgets/empty_view.dart';
import 'package:alalamia_admin/core/widgets/error_view.dart';
import 'package:alalamia_admin/core/widgets/user_avatar_body.dart';
import 'package:alalamia_admin/modules/orders/controllers/orders/orders_cubit.dart';
import 'package:alalamia_admin/modules/orders/controllers/orders_search/orders_search_cubit.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/fake_order_response_mode.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Import widget parts for modular UI components
part 'widgets/orders_search_form.dart';
part 'widgets/orders_filter_body.dart';
part 'widgets/orders_item_body.dart';
part 'widgets/orders_loading_body.dart';
part 'widgets/orders_search_body.dart';
part 'widgets/orders_pagination_body.dart';

/// Main orders screen displaying list of orders with search and pagination
/// Provides infinite scroll pagination and real-time search functionality
/// Part of the main bottom navigation tab structure
@RoutePage()
class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(final BuildContext context) => MultiBlocProvider(
    providers: [
      // Orders management cubit for pagination and data fetching
      BlocProvider(create: (final context) => di<OrdersCubit>()),
      // Search functionality cubit for local filtering
      BlocProvider(create: (final context) => di<OrdersSearchCubit>()),
    ],
    child: const _OrderViewBody(),
  );
}

/// Private body widget containing the main orders screen content
/// Handles pull-to-refresh and conditional rendering based on search state
class _OrderViewBody extends StatefulWidget {
  const _OrderViewBody();

  @override
  State<_OrderViewBody> createState() => _OrderViewBodyState();
}

/// State class for orders view body with refresh and search integration
class _OrderViewBodyState extends State<_OrderViewBody> {
  @override
  Widget build(final BuildContext context) {
    final cubit = context.read<OrdersCubit>();
    final cubitSearch = context.read<OrdersSearchCubit>();

    return RefreshIndicator(
      strokeWidth: 1,
      // Refresh orders list and clear search when user pulls down
      onRefresh: () async {
        cubit.pagingController.refresh();
        cubitSearch.clearSearch();
      },
      child: BlocBuilder<OrdersSearchCubit, OrdersSearchState>(
        builder:
            (final context, final cubitState) => Column(
              children: [
                // Search form at the top of the screen
                const _OrderSearchForm(),

                // Show pagination view when search is disabled
                if (cubitState is DisabledMode) const _OrdersPaginationBody(),

                // Show search results when search is active (enabled or empty)
                if (cubitState is EnabledMode || cubitState is EmptyMode)
                  const _OrdersSearchBody(),
              ],
            ),
      ),
    );
  }
}
