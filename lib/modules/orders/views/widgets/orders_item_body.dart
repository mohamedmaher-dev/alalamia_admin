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
              ListTile(
                leading: Icon(CupertinoIcons.person),
                title: Text(model.userName, style: TextStyles.tsP12B),
                subtitle: Text(language.client_name),
                trailing: Icon(CupertinoIcons.right_chevron),
              ),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: Icon(CupertinoIcons.phone),
                      title: Text(model.phone, style: TextStyles.tsP12B),
                      subtitle: Text(language.client_number),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      leading: Icon(CupertinoIcons.clock),
                      title: Text(
                        Jiffy.parse(model.bookingDate).fromNow(),
                        style: TextStyles.tsP12B,
                      ),
                      subtitle: Text(language.order_date),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: Icon(CupertinoIcons.number),
                      title: Text(
                        model.requestNumber,
                        style: TextStyles.tsP12B,
                      ),
                      subtitle: Text(language.order_number),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      leading: Icon(CupertinoIcons.money_dollar_circle),
                      title: Text(
                        model.paymentType.paymentTypeText,
                        style: TextStyles.tsP12B,
                      ),
                      subtitle: Text(language.payment_type),
                    ),
                  ),
                ],
              ),
              Divider(),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.all(kNormalPadding),
                margin: EdgeInsets.all(kNormalMargin),
                decoration: BoxDecoration(
                  color: model.status.orderStatusColor,
                  borderRadius: BorderRadius.circular(kNormalRadius),
                ),
                child: Text(
                  model.status.orderStatusText,
                  style: TextStyles.ts12B.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
