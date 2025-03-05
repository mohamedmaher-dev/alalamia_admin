part of '../one_order_view.dart';

class _FloatBrn extends StatefulWidget {
  const _FloatBrn({required this.orderItem});
  final OrderItem orderItem;

  @override
  State<_FloatBrn> createState() => _FloatBrnState();
}

class _FloatBrnState extends State<_FloatBrn> with TickerProviderStateMixin {
  late final AnimationController _controller;
  GlobalKey body = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    ); // Start the animation
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
    return BlocListener<InvoiceCubit, InvoiceState>(
      listener: inVoiceListener,
      child: Column(
        children: [
          const Spacer(),
          SlideTransition(
            position: _controller.drive(
              Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, 2)),
            ),
            child: IconButton.filled(
              onPressed: () {
                if (_controller.isDismissed) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
              },
              icon: AnimatedIcon(
                progress: _controller,
                icon: AnimatedIcons.close_menu,
              ),
            ),
          ),
          SlideTransition(
            position: _controller.drive(
              Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, 1)),
            ),
            child: Card(
              key: body,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      CupertinoIcons.money_dollar_circle_fill,
                    ),
                    title: Text(
                      '${widget.orderItem.cart.priceSum} ${widget.orderItem.cart.user.wallet.currencyName}',
                      style: TextStyles.tsP15B,
                    ),
                    subtitle: Text(language.total_price),
                  ),
                  const Divider(),
                  Padding(
                    padding: EdgeInsets.all(kNormalPadding),
                    child: Row(
                      children: [
                        Expanded(
                          child: GeneralBtn(
                            title: language.confirm,
                            icon: CupertinoIcons.checkmark_alt,
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: kNormalPadding),
                        Expanded(
                          child: OutlineBtn(
                            color: ColorManger.green,
                            title: language.invoice,
                            icon: CupertinoIcons.doc,
                            onPressed: () async {
                              cubit.show(widget.orderItem);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
