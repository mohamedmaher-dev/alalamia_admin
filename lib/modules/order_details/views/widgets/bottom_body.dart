part of '../one_order_view.dart';

class _BottomBody extends StatelessWidget {
  const _BottomBody();

  @override
  Widget build(final BuildContext context) {
    final args = Provider.of<OrdersDatum>(context);
    final orderDetails = Provider.of<OrdersDetailsResponseModel>(context);
    final language = Language.of(context);
    final cubit = context.read<InvoiceCubit>();
    return BlocListener<InvoiceCubit, InvoiceState>(
      listener: inVoiceListener,
      child: Column(
        children: [
          ListTile(
            leading: CurrencyView(
              countryModel: args.countryModel,
              textStyle: TextStyles.tsP15B,
            ),
            title: Text(
              orderDetails.priceSum.toString(),
              style: TextStyles.tsP15B,
            ),
            subtitle: Text(language.total_price),
            trailing: IconButton.filled(
              style: IconButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(kNormalRadius),
                  ),
                ),
              ),
              onPressed: () => cubit.show(orderDetails, args),
              icon: const Icon(CupertinoIcons.doc, color: Colors.black),
            ),
          ),
          const _ApprovedAndRejectButtons(),
        ],
      ),
    );
  }
}

class _ApprovedAndRejectButtons extends StatelessWidget {
  const _ApprovedAndRejectButtons();

  @override
  Widget build(final BuildContext context) {
    final args = Provider.of<OrdersDatum>(context);
    final language = Language.of(context);
    final orderStatusCubit = context.read<OrderStatusCubit>();

    return Column(
      children: [
        const Divider(),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: kLargeMargin,
            horizontal: kMediumMargin,
          ),
          child: BlocListener<OrderStatusCubit, OrderStatusState>(
            listener:
                (final context, final state) =>
                    orderStatusListener(context, state),
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
}

void _showConfirmationDialog(
  final BuildContext context,
  final String title,
  final String subtitle,
  final VoidCallback onConfirmed,
) {
  showChangerPopUpConfirm(
    context: context,
    title: title,
    subtitle: subtitle,
    onPressed: onConfirmed,
  );
}
