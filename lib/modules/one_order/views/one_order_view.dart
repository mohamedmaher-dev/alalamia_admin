import 'package:alalamia_admin/core/di/di.dart';
import 'package:alalamia_admin/core/localization/generated/l10n.dart';
import 'package:alalamia_admin/core/themes/app_theme_data.dart';
import 'package:alalamia_admin/core/themes/theme_consts.dart';
import 'package:alalamia_admin/core/utils/validation.dart';
import 'package:alalamia_admin/core/widgets/general_btn.dart';
import 'package:alalamia_admin/core/widgets/outline_btn.dart';
import 'package:alalamia_admin/modules/invoice/controllers/invoice/invoice_cubit.dart';
import 'package:alalamia_admin/modules/invoice/views/widgets/invoice_listener.dart';
import 'package:alalamia_admin/modules/notification/controllers/send_fcm/send_fcm_cubit.dart';
import 'package:alalamia_admin/modules/notification/controllers/send_fcm/send_fcm_listener.dart';
import 'package:alalamia_admin/modules/orders/data/models/orders/orders_response_model.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
part 'widgets/float_btn_body.dart';
part 'widgets/general_body.dart';
part 'widgets/order_state_steps.dart';
part 'widgets/cart_body.dart';
part 'widgets/notifi_body.dart';

class OneOrderView extends StatelessWidget {
  const OneOrderView({super.key, required this.orderItem});
  final OrderItem orderItem;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di<InvoiceCubit>()),
        BlocProvider(create: (context) => di<FcmCubit>()),
      ],
      child: _OneOrderViewBody(orderItem: orderItem),
    );
  }
}

class _OneOrderViewBody extends StatelessWidget {
  const _OneOrderViewBody({required this.orderItem});
  final OrderItem orderItem;

  @override
  Widget build(BuildContext context) {
    final fcmCubit = context.read<FcmCubit>();
    return MultiBlocListener(
      listeners: [
        BlocListener<InvoiceCubit, InvoiceState>(listener: inVoiceListener),
        BlocListener<FcmCubit, FcmState>(listener: fcmListener),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(orderItem.cart.user.name),
            subtitle: Text(orderItem.requestNumber),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder:
                      (context) => _NotifiBody(
                        fcmCubit: fcmCubit,
                        fcmToken: orderItem.cart.user.fcm,
                      ),
                );
              },
              icon: const Icon(Icons.add_alert),
            ),
          ],
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                _GeneralBody(orderItem: orderItem),
                if (orderItem.cart.items.isNotEmpty)
                  _CartBody(orderItem: orderItem),
              ],
            ),
            _FloatBrn(orderItem: orderItem),
          ],
        ),
      ),
    );
  }
}
