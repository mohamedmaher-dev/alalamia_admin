part of '../one_order_view.dart';

/// Bottom section widget for order details screen displaying pricing and action buttons
/// Shows total price with currency and provides PDF invoice generation capability
/// Contains approve/reject buttons for order status management
class _BottomBody extends StatelessWidget {
  const _BottomBody();

  @override
  Widget build(final BuildContext context) {
    final args = Provider.of<OrdersDatum>(context);
    final orderDetails = Provider.of<OrdersDetailsResponseModel>(context);
    final language = Language.of(context);
    final cubit = context.read<InvoiceCubit>();
    return BlocListener<InvoiceCubit, InvoiceState>(
      // Listen to invoice generation state changes
      listener: inVoiceListener,
      child: Column(
        children: [
          // Total price display with invoice generation button
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
              // Generate and display PDF invoice when pressed
              onPressed: () => cubit.show(orderDetails, args),
              icon: const Icon(CupertinoIcons.doc, color: Colors.black),
            ),
          ),
          // Order approval and rejection action buttons
          const _ApprovedAndRejectButtons(),
        ],
      ),
    );
  }
}

/// Order action buttons widget for approve and reject operations
/// Provides admin controls for changing order status with confirmation dialogs
/// Shows different button combinations based on current order status
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
            // Listen to order status change operations
            listener:
                (final context, final state) =>
                    orderStatusListener(context, state),
            child: Row(
              children: [
                // Approve button - shown for requested or canceled orders
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
                              // Change status to received/approved
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
                // Cancel/Reject button - shown for all non-canceled orders
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
                              // Change status to canceled
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

/// Utility function for showing order action confirmation dialogs
/// Displays a confirmation popup before executing order status changes
/// Provides user safety by requiring explicit confirmation for destructive actions
///
/// [context] - Build context for dialog display
/// [title] - Dialog title text
/// [subtitle] - Dialog confirmation message
/// [onConfirmed] - Callback executed when user confirms the action
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
