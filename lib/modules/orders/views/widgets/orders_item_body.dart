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
          await AppRouter.push(AppPages.orderDetails, extra: model);
          cubit.pagingController.refresh();
        },
        child: Skeletonizer(
          enabled: isLoading,
          child: Card(
            child: Column(
              children: [
                ExpansionTile(
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
                  title: const _ClientTitleBody(),
                  children: const <Widget>[_ExpandedBody()],
                ),
                _RowDataItemOrderItem(
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

class _DataItemOrderItem extends StatelessWidget {
  const _DataItemOrderItem({
    required this.title,
    required this.subTitle,
    required this.icon,
  });
  final String title;
  final String subTitle;
  final Widget icon;

  @override
  Widget build(final BuildContext context) => ListTile(
    dense: true,
    leading: Container(
      padding: EdgeInsets.all(kNormalPadding),
      decoration: BoxDecoration(
        color: ColorManger.scaffoldColor,
        borderRadius: BorderRadius.circular(kNormalRadius),
      ),
      child: icon,
    ),
    title: Text(title, style: TextStyles.tsP12B),
    subtitle: Text(subTitle),
  );
}

class _RowDataItemOrderItem extends StatelessWidget {
  const _RowDataItemOrderItem({
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
        child: _DataItemOrderItem(
          title: title1,
          subTitle: subTitle1,
          icon: icon1,
        ),
      ),
      Expanded(
        child: _DataItemOrderItem(
          title: title2,
          subTitle: subTitle2,
          icon: icon2,
        ),
      ),
    ],
  );
}

class _ExpandedBody extends StatelessWidget {
  const _ExpandedBody();

  @override
  Widget build(final BuildContext context) {
    final model = Provider.of<OrdersDatum>(context);
    final language = Language.of(context);
    return Column(
      children: [
        _RowDataItemOrderItem(
          title1: model.paymentType.paymentTypeText,
          subTitle1: language.payment_type,
          icon1: const Icon(CupertinoIcons.money_dollar_circle),

          title2: Jiffy.parseFromDateTime(
            DateTime.parse(model.bookingDate).toUtc(),
          ).from(Jiffy.parseFromDateTime(DateTime.now().toUtc())),
          subTitle2: language.time_ago,
          icon2: const Icon(CupertinoIcons.clock),
        ),

        _DataItemOrderItem(
          title: Jiffy.parse(model.bookingDate).yMMMMEEEEdjm,
          subTitle: language.order_date,
          icon: const Icon(CupertinoIcons.calendar),
        ), // Add more widgets here as needed
      ],
    );
  }
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
        color: model.status.orderStatusColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(kNormalRadius),
        ),
      ),
      child: Text(
        textAlign: TextAlign.center,
        model.status.orderStatusText,
        style: TextStyles.ts12B.copyWith(color: Colors.black),
      ),
    );
  }
}

class _ClientTitleBody extends StatelessWidget {
  const _ClientTitleBody();

  @override
  Widget build(final BuildContext context) {
    final model = Provider.of<OrdersDatum>(context);
    final language = Language.of(context);
    return ListTile(
      title: Text(model.userName, style: TextStyles.tsP12B),
      subtitle: Text(
        language.client_name,
        style: const TextStyle(color: Colors.grey),
      ),
      leading: UserAvatarBody(userName: model.userName),
    );
  }
}
