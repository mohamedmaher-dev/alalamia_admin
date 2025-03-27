part of '../one_order_view.dart';

class _FloatBody extends StatelessWidget {
  const _FloatBody(this.orderDetails, this.args);
  final OrdersDetailsResponseModel orderDetails;
  final OrdersDatum args;

  @override
  Widget build(BuildContext context) {
    final language = Language.of(context);
    final cubit = context.read<InvoiceCubit>();
    final orderStatusCubit = context.read<OrderStatusCubit>();
    return BlocListener<InvoiceCubit, InvoiceState>(
      listener: inVoiceListener,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(CupertinoIcons.money_dollar_circle_fill),
            title: Text(
              '${orderDetails.priceSum} ${args.currency}',
              style: TextStyles.tsP15B,
            ),
            subtitle: Text(language.total_price),
            trailing: IconButton.outlined(
              onPressed: () => cubit.show(orderDetails, args),
              icon: const Icon(CupertinoIcons.doc),
            ),
          ),
          _buildApprovedAndRejectButtons(language, orderStatusCubit, context),
        ],
      ),
    );
  }

  Widget _buildApprovedAndRejectButtons(
    Language language,
    OrderStatusCubit orderStatusCubit,
    BuildContext context,
  ) {
    return Column(
      children: [
        const Divider(),
        Padding(
          padding: EdgeInsets.all(kNormalPadding),
          child: BlocListener<OrderStatusCubit, OrderStatusState>(
            listener: (context, state) => orderStatusListener(context, state),
            child: Row(
              children: [
                if (args.status == OrderStatus.requested ||
                    args.status == OrderStatus.canceled)
                  Expanded(
                    child: GeneralBtn(
                      title: language.approve,
                      icon: CupertinoIcons.checkmark_alt,
                      onPressed:
                          () => _showConfirmationDialog(
                            context,
                            language.approve_this_order,
                            language.do_you_want_to_approve_this_order,
                            () {
                              orderStatusCubit.changeStatus(
                                OrderStatus.received.enumToindex,
                                args.status.enumToindex,
                                args.id.toString(),
                              );
                            },
                          ),
                    ),
                  ),
                SizedBox(width: kNormalPadding),
                if (args.status != OrderStatus.canceled)
                  Expanded(
                    child: OutlineBtn(
                      color: ColorManger.red,
                      title: language.cancel,
                      icon: CupertinoIcons.clear,
                      onPressed:
                          () => _showConfirmationDialog(
                            context,
                            language.reject_this_order,
                            language.do_you_want_to_reject_this_order,
                            () {
                              orderStatusCubit.changeStatus(
                                OrderStatus.canceled.enumToindex,
                                args.status.enumToindex,

                                args.id.toString(),
                              );
                            },
                          ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showConfirmationDialog(
    BuildContext context,
    String title,
    String subtitle,
    VoidCallback onConfirmed,
  ) {
    showChangerPopUpConfirm(
      context: context,
      title: title,
      subtitle: subtitle,
      onPressed: onConfirmed,
    );
  }
}
