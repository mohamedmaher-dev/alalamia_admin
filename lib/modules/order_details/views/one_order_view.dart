import 'package:alalamia_admin/core/di/di.dart';
import 'package:alalamia_admin/core/extension/order_payment_type.dart';
import 'package:alalamia_admin/core/extension/order_status_ext.dart';
import 'package:alalamia_admin/core/extension/string_ext.dart';
import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:alalamia_admin/core/widgets/error_view.dart';
import 'package:alalamia_admin/core/widgets/general_btn.dart';
import 'package:alalamia_admin/core/widgets/loading_view.dart';
import 'package:alalamia_admin/core/widgets/outline_btn.dart';
import 'package:alalamia_admin/core/widgets/pop_confirm.dart';
import 'package:alalamia_admin/modules/invoice/controllers/invoice/invoice_cubit.dart';
import 'package:alalamia_admin/modules/invoice/views/widgets/invoice_listener.dart';
import 'package:alalamia_admin/modules/order_details/controllers/order_details/order_details_cubit.dart';
import 'package:alalamia_admin/modules/order_details/controllers/order_status/order_status_cubit.dart';
import 'package:alalamia_admin/modules/order_details/controllers/order_status/order_status_listener.dart';
import 'package:alalamia_admin/modules/order_details/data/models/orders_details_response_model/cart_detail.dart';
import 'package:alalamia_admin/modules/order_details/data/models/orders_details_response_model/orders_details_response_model.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/datum.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders_response_model/order_status.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_launcher/map_launcher.dart';
part 'widgets/float_body.dart';
part 'widgets/order_state_steps.dart';
part 'widgets/cart_body.dart';
part 'widgets/client_body.dart';
part 'widgets/address_body.dart';
part 'widgets/other_body.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.args});
  final OrdersDatum args;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di<InvoiceCubit>()),
        BlocProvider(
          create:
              (context) => di<OrderDetailsCubit>()..start(args.id.toString()),
        ),
        BlocProvider(create: (context) => di<OrderStatusCubit>()),
      ],
      child: _OrderDetailsViewBody(args),
    );
  }
}

class _OrderDetailsViewBody extends StatelessWidget {
  const _OrderDetailsViewBody(this.args);
  final OrdersDatum args;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
      builder: (context, state) {
        return state.when(
          loading: () => LoadingView(),
          success:
              (order) => Scaffold(
                appBar: AppBar(
                  forceMaterialTransparency: true,
                  title: ListTile(
                    title: Text(order.userName.nullToString),
                    subtitle: Text(order.requestNo.nullToString),
                  ),
                ),
                body: Stack(
                  children: [
                    ListView(
                      children: [
                        _ClientBody(order: order, args: args),
                        _CartBody(cart: order.cartDetail!),
                        if (order.address != null)
                          _AddressBody(order: order, args: args),
                        _OtherBody(order: order, args: args),
                        SizedBox(height: kSpacingBetweenWidgetsHight),
                      ],
                    ),
                    _FloatBody(order, args),
                  ],
                ),
              ),
          failure: (error) => ErrorView(),
        );
      },
    );
  }
}
