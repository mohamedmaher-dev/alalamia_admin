import 'package:alalamia_admin/core/di/di.dart';
import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/router/app_router.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:alalamia_admin/core/widgets/empty_view.dart';
import 'package:alalamia_admin/core/widgets/error_view.dart';
import 'package:alalamia_admin/modules/orders/controlers/orders/orders_cubit.dart';
import 'package:alalamia_admin/modules/orders/controlers/orders_search/orders_search_cubit.dart';
import 'package:alalamia_admin/modules/orders/controlers/orders_tab/orders_tab_cubit.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders/fake_order_model.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders/orders_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jiffy/jiffy.dart';
import 'package:skeletonizer/skeletonizer.dart';
part 'widgets/orders_tab_body.dart';
part 'widgets/orders_search_form.dart';
part 'widgets/orders_filter_body.dart';
part 'widgets/orders_item_body.dart';
part 'widgets/orders_loading_body.dart';
part 'widgets/orders_search_body.dart';
part 'widgets/orders_pagination_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di<OrdersTabCubit>()),
        BlocProvider(create: (context) => di<OrdersCubit>()),
        BlocProvider(create: (context) => di<OrdersSearchCubit>()),
      ],
      child: _OrderViewBody(),
    );
  }
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
                _OrdersTabBody(),
                _OrderSearchForm(),
                if (cubitState is DisabledMode) _OrdersPaginationBody(),
                if (cubitState is EnabledMode || cubitState is EmptyMode)
                  _OrdersSearchBody(),
              ],
            ),
      ),
    );
  }
}
