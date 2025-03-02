import 'package:alalamia_admin/core/di/di.dart';
import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/router/app_router.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:alalamia_admin/core/widgets/empty_view.dart';
import 'package:alalamia_admin/core/widgets/error_view.dart';
import 'package:alalamia_admin/modules/orders/controlers/orders/orders_cubit.dart';
import 'package:alalamia_admin/modules/orders/controlers/orders_tab/orders_tab_cubit.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders/fake_order_model.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders/orders_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:skeletonizer/skeletonizer.dart';
part 'widgets/orders_tab_body.dart';
part 'widgets/order_search_body.dart';
part 'widgets/order_filter_body.dart';
part 'widgets/order_item_body.dart';
part 'widgets/orders_success_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di<OrdersTabCubit>()),
        BlocProvider(create: (context) => di<OrdersCubit>()..getOrders(1)),
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
    return RefreshIndicator(
      strokeWidth: 1,
      onRefresh: () async => context.read<OrdersCubit>().getOrders(1),
      child: Column(
        children: [
          _OrderSearchBody(),
          Expanded(
            child: BlocBuilder<OrdersCubit, OrdersState>(
              builder: (context, state) {
                return state.when(
                  loading: () => _OrdersSuccessBody(isLoading: true),
                  success: (data) => _OrdersSuccessBody(items: data),
                  empty: () => EmptyView(icon: Icons.list, text: 'No Orders'),
                  failure: (e) => ErrorView(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
