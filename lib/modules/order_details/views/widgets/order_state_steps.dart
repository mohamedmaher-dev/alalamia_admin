part of '../one_order_view.dart';

class _OrderStateSteps extends StatelessWidget {
  const _OrderStateSteps({required this.orderStatus, required this.orderId});
  final String orderId;
  final OrderStatus orderStatus;

  @override
  Widget build(final BuildContext context) {
    final cubit = context.read<OrderStatusCubit>();
    final activeStep = orderStatus.enumToindex;
    final language = Language.of(context);
    return EasyStepper(
      activeStep: activeStep,
      activeStepTextColor: ColorManger.myGold,
      unreachedStepTextColor: ColorManger.myGold,
      finishedStepTextColor: ColorManger.myGold,
      defaultStepBorderType: BorderType.normal,
      lineStyle: const LineStyle(lineType: LineType.normal),
      showLoadingAnimation: false,
      stepRadius: 10,
      onStepReached: (final index) {
        if (orderStatus != OrderStatus.canceled) {
          showChangerPopUpConfirm(
            context: context,
            title: language.change_status,
            subtitle:
                language.are_you_sure_you_want_to_change_this_order_status,
            onPressed: () {
              cubit.changeStatus(index, orderStatus.enumToindex, orderId);
            },
          );
        }
      },
      steps: [
        EasyStep(
          customStep: CircleAvatar(
            radius: 7,
            backgroundColor: activeStep >= 0 ? ColorManger.myGold : Colors.grey,
          ),
          title: language.status_review,
        ),
        if (orderStatus == OrderStatus.canceled)
          EasyStep(
            customStep: const CircleAvatar(
              radius: 7,
              backgroundColor: Colors.red,
            ),
            title: language.status_canceled,
            topTitle: true,
          ),
        if (orderStatus != OrderStatus.canceled)
          EasyStep(
            customStep: CircleAvatar(
              radius: 7,
              backgroundColor:
                  activeStep >= 1 ? ColorManger.myGold : Colors.grey,
            ),
            title: language.status_approved,
            topTitle: true,
          ),
        if (orderStatus != OrderStatus.canceled)
          EasyStep(
            customStep: CircleAvatar(
              radius: 7,
              backgroundColor:
                  activeStep >= 2 ? ColorManger.myGold : Colors.grey,
            ),
            title: language.status_preparing,
          ),
        if (orderStatus != OrderStatus.canceled)
          EasyStep(
            customStep: CircleAvatar(
              radius: 7,
              backgroundColor:
                  activeStep >= 3 ? ColorManger.myGold : Colors.grey,
            ),
            title: language.status_on_the_way,
            topTitle: true,
          ),
        if (orderStatus != OrderStatus.canceled)
          EasyStep(
            customStep: CircleAvatar(
              radius: 7,
              backgroundColor:
                  activeStep >= 4 ? ColorManger.myGold : Colors.grey,
            ),
            title: language.status_delivered,
          ),
      ],
    );
  }
}
