part of '../orders_view.dart';

class _OrderItemBody extends StatelessWidget {
  const _OrderItemBody({
    required this.index,
    required this.model,
    required this.isLoading,
  });
  final OrdersDatum model;
  final int index;
  final bool isLoading;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<OrdersCubit>();
    final language = Language.of(context);
    return Provider(
      create: (final context) => model,
      child: GestureDetector(
        onTap: () async {
          await context.router.push(OrderDetailsRoute(args: model));
          cubit.pagingController.refresh();
        },
        child: Skeletonizer(
          enabled: isLoading,
          child: Card(
            child: Column(
              children: [
                ExpansionTile(
                  childrenPadding: EdgeInsets.zero,
                  initiallyExpanded: index == 0,
                  trailing: Container(
                    padding: EdgeInsets.all(kNormalPadding),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(kNormalRadius),
                    ),
                    child: const Icon(CupertinoIcons.chevron_down),
                  ),
                  tilePadding: EdgeInsetsDirectional.only(end: kLargePadding),
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: CustomListTile(
                    icon: UserAvatarBody(userName: model.userName),
                    backgroundColor: Colors.transparent,
                    backgroundIconColor: Colors.transparent,
                    title: model.userName,
                    titleIsBold: true,
                    titleColor: ColorManger.primary,
                    subTitle: language.client_name,
                  ),
                  children: <Widget>[
                    _RowItemInfo(
                      title1: model.paymentType.paymentTypeText,
                      subTitle1: language.payment_type,
                      icon1: const Icon(CupertinoIcons.money_dollar_circle),
                      title2: Jiffy.parseFromDateTime(
                        DateTime.parse(model.bookingDate).toUtc(),
                      ).from(Jiffy.parseFromDateTime(DateTime.now().toUtc())),
                      subTitle2: language.time_ago,
                      icon2: const Icon(CupertinoIcons.clock),
                    ),
                    CustomListTile(
                      title: Jiffy.parse(model.bookingDate).yMMMMEEEEdjm,
                      subTitle: language.order_date,
                      icon: const Icon(CupertinoIcons.calendar),
                      isDense: true,
                    ),
                  ],
                ),
                _RowItemInfo(
                  icon1: const Icon(CupertinoIcons.phone),
                  title1: model.phone,
                  subTitle1: language.client_number,
                  icon2: const Icon(CupertinoIcons.number),
                  title2: model.requestNumber,
                  subTitle2: language.order_number,
                ),
                const _StatusBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RowItemInfo extends StatelessWidget {
  const _RowItemInfo({
    required this.title1,
    required this.subTitle1,
    required this.icon1,
    required this.title2,
    required this.subTitle2,
    required this.icon2,
  });
  final String title1;
  final String subTitle1;
  final Widget icon1;
  final String title2;
  final String subTitle2;
  final Widget icon2;

  @override
  Widget build(final BuildContext context) => Row(
    children: [
      Expanded(
        child: CustomListTile(
          title: title1,
          subTitle: subTitle1,
          icon: icon1,

          isDense: true,
        ),
      ),
      Expanded(
        child: CustomListTile(
          title: title2,
          subTitle: subTitle2,
          icon: icon2,

          isDense: true,
        ),
      ),
    ],
  );
}

class _StatusBody extends StatelessWidget {
  const _StatusBody();

  @override
  Widget build(final BuildContext context) {
    final model = Provider.of<OrdersDatum>(context);
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.all(kNormalPadding),
      decoration: BoxDecoration(
        color: model.status.orderStatusColor.withAlpha(kBackgroundColorAlpha),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(kNormalRadius),
        ),
      ),
      child: Text(
        textAlign: TextAlign.center,
        model.status.orderStatusText,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
          color: model.status.orderStatusColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
