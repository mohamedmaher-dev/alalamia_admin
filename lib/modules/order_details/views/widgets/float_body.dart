part of '../one_order_view.dart';

class _FloatBody extends StatefulWidget {
  const _FloatBody(this.orderDetails, this.args);
  final OrdersDetailsResponseModel orderDetails;
  final OrdersDatum args;

  @override
  State<_FloatBody> createState() => _FloatBodyState();
}

class _FloatBodyState extends State<_FloatBody> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  final GlobalKey body = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final language = Language.of(context);
    final cubit = context.read<InvoiceCubit>();
    final orderStatusCubit = context.read<OrderStatusCubit>();

    return BlocListener<InvoiceCubit, InvoiceState>(
      listener: inVoiceListener,
      child: Column(
        children: [
          const Spacer(),
          _buildFloatingButton(),
          _buildOrderDetailsCard(language, cubit, orderStatusCubit),
        ],
      ),
    );
  }

  Widget _buildFloatingButton() {
    return SlideTransition(
      position: _slideAnimation,
      child: FloatingActionButton(
        onPressed: () {
          _controller.isDismissed
              ? _controller.forward()
              : _controller.reverse();
        },
        child: AnimatedIcon(
          progress: _controller,
          icon: AnimatedIcons.menu_close,
        ),
      ),
    );
  }

  Widget _buildOrderDetailsCard(
    Language language,
    InvoiceCubit cubit,
    OrderStatusCubit orderStatusCubit,
  ) {
    return SlideTransition(
      position: _slideAnimation,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kNormalRadius),
        ),
        key: body,
        child: Column(
          children: [
            ListTile(
              leading: const Icon(CupertinoIcons.money_dollar_circle_fill),
              title: Text(
                '${widget.orderDetails.priceSum} ${widget.args.currency}',
                style: TextStyles.tsP15B,
              ),
              subtitle: Text(language.total_price),
              trailing: IconButton.outlined(
                onPressed: () => cubit.show(widget.orderDetails, widget.args),
                icon: const Icon(CupertinoIcons.doc),
              ),
            ),
            _buildApprovedAndRejectButtons(language, orderStatusCubit),
          ],
        ),
      ),
    );
  }

  Widget _buildApprovedAndRejectButtons(
    Language language,
    OrderStatusCubit orderStatusCubit,
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
                if (widget.args.status == OrderStatus.requested ||
                    widget.args.status == OrderStatus.canceled)
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
                                widget.args.status.enumToindex,
                                widget.args.id.toString(),
                              );
                            },
                          ),
                    ),
                  ),
                SizedBox(width: kNormalPadding),
                if (widget.args.status != OrderStatus.canceled)
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
                                widget.args.status.enumToindex,

                                widget.args.id.toString(),
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
