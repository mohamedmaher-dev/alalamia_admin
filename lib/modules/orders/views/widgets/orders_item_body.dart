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
  Widget build(BuildContext context) {
    final cubit = context.read<OrdersCubit>();
    final language = Language.of(context);
    return GestureDetector(
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
                trailing: Container(
                  padding: EdgeInsets.all(kNormalPadding),
                  decoration: BoxDecoration(
                    color: ColorManger.scaffoldColor,
                    borderRadius: BorderRadius.circular(kNormalRadius),
                  ),
                  child: Icon(CupertinoIcons.chevron_down),
                ),
                tilePadding: EdgeInsetsDirectional.only(end: kLargePadding),
                controlAffinity: ListTileControlAffinity.trailing,
                title: _ClientTitleBody(model: model),
                children: <Widget>[_ExpandedBody(model: model)],
              ),
              _RowDataItemOrderItem(
                icon1: Icon(CupertinoIcons.phone),
                title1: model.phone,
                subTitle1: language.client_number,
                icon2: Icon(CupertinoIcons.number),
                title2: model.requestNumber,
                subTitle2: language.order_number,
              ),
              _StatusBody(model: model),
            ],
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
  Widget build(BuildContext context) {
    return ListTile(
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
  Widget build(BuildContext context) {
    return Row(
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
}

class _ExpandedBody extends StatelessWidget {
  const _ExpandedBody({required this.model});
  final OrdersDatum model;

  @override
  Widget build(BuildContext context) {
    final language = Language.of(context);
    return Column(
      children: [
        _RowDataItemOrderItem(
          title1: model.paymentType.paymentTypeText,
          subTitle1: language.payment_type,
          icon1: Icon(CupertinoIcons.money_dollar_circle),

          title2: Jiffy.parseFromDateTime(
            DateTime.parse(model.bookingDate).toUtc(),
          ).from(Jiffy.parseFromDateTime(DateTime.now().toUtc())),
          subTitle2: language.time_ago,
          icon2: Icon(CupertinoIcons.clock),
        ),

        _DataItemOrderItem(
          title: Jiffy.parse(model.bookingDate).yMMMMEEEEdjm,
          subTitle: language.order_date,
          icon: Icon(CupertinoIcons.calendar),
        ), // Add more widgets here as needed
      ],
    );
  }
}

class _StatusBody extends StatelessWidget {
  const _StatusBody({required this.model});
  final OrdersDatum model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.all(kNormalPadding),
      margin: EdgeInsets.all(kNormalMargin),
      decoration: BoxDecoration(
        color: model.status.orderStatusColor,
        borderRadius: BorderRadius.circular(kNormalRadius),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              textAlign: TextAlign.center,
              model.status.orderStatusText,
              style: TextStyles.ts12B.copyWith(color: Colors.black),
            ),
          ),
          Icon(CupertinoIcons.chevron_left_circle, color: Colors.black),
        ],
      ),
    );
  }
}

class _ClientTitleBody extends StatelessWidget {
  const _ClientTitleBody({required this.model});
  final OrdersDatum model;

  @override
  Widget build(BuildContext context) {
    final language = Language.of(context);
    return ListTile(
      title: Text(model.userName, style: TextStyles.tsP12B),
      subtitle: Text(
        language.client_name,
        style: TextStyle(color: Colors.grey),
      ),
      leading: Initicon(
        size: 35.r,
        text: model.userName.substring(0, 1).toUpperCase(),
        backgroundColor: ColorManger.myGold,
        borderRadius: BorderRadius.circular(kNormalRadius),
        style: TextStyle(
          fontFamily: AppThemeData.fontFamily,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
