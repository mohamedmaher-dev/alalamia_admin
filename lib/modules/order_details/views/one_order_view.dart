import 'package:alalamia_admin/core/config/app_config_model.dart';
import 'package:alalamia_admin/core/di/di.dart';
import 'package:alalamia_admin/core/extension/order_payment_type.dart';
import 'package:alalamia_admin/core/extension/order_status_ext.dart';
import 'package:alalamia_admin/core/extension/string_ext.dart';
import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:alalamia_admin/core/widgets/app_snack_bar.dart';
import 'package:alalamia_admin/core/widgets/currency_view.dart';
import 'package:alalamia_admin/core/widgets/custom_list_tile.dart';
import 'package:alalamia_admin/core/widgets/empty_view.dart';
import 'package:alalamia_admin/core/widgets/error_view.dart';
import 'package:alalamia_admin/core/widgets/general_btn.dart';
import 'package:alalamia_admin/core/widgets/loading_view.dart';
import 'package:alalamia_admin/core/widgets/outline_btn.dart';
import 'package:alalamia_admin/core/widgets/pop_confirm.dart';
import 'package:alalamia_admin/core/widgets/user_avatar_body.dart';
import 'package:alalamia_admin/modules/invoice/controllers/invoice/invoice_cubit.dart';
import 'package:alalamia_admin/modules/invoice/views/widgets/invoice_listener.dart';
import 'package:alalamia_admin/modules/order_details/controllers/order_details/order_details_cubit.dart';
import 'package:alalamia_admin/modules/order_details/controllers/order_details_tab/order_details_tab_cubit.dart';
import 'package:alalamia_admin/modules/order_details/controllers/order_status/order_status_cubit.dart';
import 'package:alalamia_admin/modules/order_details/controllers/order_status/order_status_listener.dart';
import 'package:alalamia_admin/modules/order_details/data/models/orders_details_response_model/cart_detail.dart';
import 'package:alalamia_admin/modules/order_details/data/models/orders_details_response_model/orders_details_response_model.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/order_status.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:provider/provider.dart';

// Import widget components for modular order details UI
part 'widgets/bottom_body.dart';
part 'widgets/order_state_steps.dart';
part 'widgets/cart_body.dart';
part 'widgets/general_body.dart';
part 'widgets/other_body.dart';
part 'widgets/tabs_body.dart';

/// Comprehensive order details screen showing complete order information
/// Provides tabbed interface for General info, Cart items, and Other details
/// Includes order status management, invoice generation, and approval actions
@RoutePage()
class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.args});

  /// Basic order data passed from the orders list
  final OrdersDatum args;

  @override
  Widget build(final BuildContext context) => MultiBlocProvider(
    providers: [
      // Invoice PDF generation cubit
      BlocProvider(create: (final context) => di<InvoiceCubit>()),
      // Order details data fetching cubit (starts fetching immediately)
      BlocProvider(
        create:
            (final context) =>
                di<OrderDetailsCubit>()..start(args.id.toString()),
      ),
      // Order status change management cubit
      BlocProvider(create: (final context) => di<OrderStatusCubit>()),
      // Tab navigation cubit for switching between sections
      BlocProvider(create: (final context) => OrderDetailsTabCubit()),
    ],
    child: Provider(
      // Provide order args to all child widgets
      child: const _OrderDetailsViewBody(),
      create: (final context) => args,
    ),
  );
}

/// Private body widget containing the order details screen structure
/// Handles different states (loading, success, error) and manages tab layout
class _OrderDetailsViewBody extends StatelessWidget {
  const _OrderDetailsViewBody();

  @override
  Widget build(final BuildContext context) {
    final cubit = BlocProvider.of<OrderDetailsCubit>(context);
    final language = Language.of(context);
    final tabCubit = BlocProvider.of<OrderDetailsTabCubit>(context);
    final args = Provider.of<OrdersDatum>(context);
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
      builder:
          (final context, final state) => state.when(
            // Show loading view while fetching order details
            loading: () => const LoadingView(),
            // Show complete order details interface when data is loaded
            success:
                (final order) => Provider(
                  // Provide detailed order data to all child widgets
                  create: (final context) => order,
                  child: Scaffold(
                    appBar: AppBar(
                      centerTitle: true,
                      forceMaterialTransparency: true,
                      title: Text(
                        language.order_details,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    body: Column(
                      children: [
                        // Tab selector for switching between sections
                        const _TabsBody(),
                        const Divider(),
                        // Main content area with PageView for tab content
                        Expanded(
                          child: PageView(
                            controller: tabCubit.pageController,
                            // Update tab state when user swipes between pages
                            onPageChanged:
                                (final value) => tabCubit.changeTab(
                                  OrderDetailsTabsModel.values[value],
                                ),
                            children: const [
                              _GeneralBody(), // Customer and order info
                              _CartBody(), // Order items and products
                              _OtherBody(), // Status tracking and additional info
                            ],
                          ),
                        ),
                        const Divider(),
                        // Bottom action area with pricing and approval buttons
                        const _BottomBody(),
                      ],
                    ),
                  ),
                ),
            // Show error view if order details fail to load
            failure:
                (final error) =>
                    ErrorView(onPressed: () => cubit.start(args.id.toString())),
          ),
    );
  }
}
