import 'package:alalamia_admin/core/di/di.dart';
import 'package:alalamia_admin/core/extension/order_payment_type.dart';
import 'package:alalamia_admin/core/extension/order_status_ext.dart';
import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/router/app_router.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:alalamia_admin/core/widgets/empty_view.dart';
import 'package:alalamia_admin/core/widgets/error_view.dart';
import 'package:alalamia_admin/modules/orders/controllers/orders/orders_cubit.dart';
import 'package:alalamia_admin/modules/orders/controllers/orders_search/orders_search_cubit.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/fake_order_response_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
part 'widgets/orders_search_form.dart';
part 'widgets/orders_filter_body.dart';
part 'widgets/orders_item_body.dart';
part 'widgets/orders_loading_body.dart';
part 'widgets/orders_search_body.dart';
part 'widgets/orders_pagination_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => di<OrdersCubit>()),
      BlocProvider(create: (context) => di<OrdersSearchCubit>()),
    ],
    child: const _OrderViewBody(),
  );
}

class _OrderViewBody extends StatefulWidget {
  const _OrderViewBody();

  @override
  State<_OrderViewBody> createState() => _OrderViewBodyState();
}

class _OrderViewBodyState extends State<_OrderViewBody> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrdersCubit>();
    final cubitSearch = context.read<OrdersSearchCubit>();
    return RefreshIndicator(
      strokeWidth: 1,
      onRefresh: () async {
        cubit.pagingController.refresh();
        cubitSearch.clearSearch();
      },
      child: BlocBuilder<OrdersSearchCubit, OrdersSearchState>(
        builder:
            (context, cubitState) => Column(
              children: [
                const _OrderSearchForm(),
                if (cubitState is DisabledMode) const _OrdersPaginationBody(),
                if (cubitState is EnabledMode || cubitState is EmptyMode)
                  const _OrdersSearchBody(),
              ],
            ),
      ),
    );
  }
}
