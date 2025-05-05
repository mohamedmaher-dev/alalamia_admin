part of '../one_order_view.dart';

class _OrderStateSteps extends StatelessWidget {
  const _OrderStateSteps();

  @override
  Widget build(final BuildContext context) {
    final args = Provider.of<OrdersDatum>(context);
    final cubit = context.read<OrderStatusCubit>();
    final activeStep = args.status.enumToindex;
    final language = Language.of(context);
    return EasyStepper(
      activeStep: activeStep,
      activeStepTextColor: ColorManger.myGold,
      finishedStepTextColor: ColorManger.myGold,
      finishedStepIconColor: ColorManger.myGold,
      unreachedStepIconColor: Colors.transparent,
      borderThickness: 2,
      defaultStepBorderType: BorderType.normal,
      lineStyle: const LineStyle(lineType: LineType.normal),
      showLoadingAnimation: false,
      stepRadius: kNormalRadius.r,
      onStepReached: (final index) {
        showChangerPopUpConfirm(
          context: context,
          title: language.change_status,
          subtitle: language.are_you_sure_you_want_to_change_this_order_status,
          onPressed: () {
            cubit.changeStatus(
              index,
              args.status.enumToindex,
              args.id.toString(),
            );
          },
        );
      },
      steps: [
        EasyStep(icon: const Icon(Icons.circle), title: language.status_review),
        EasyStep(
          icon: const Icon(Icons.circle),
          title: language.status_approved,
          topTitle: true,
        ),
        EasyStep(
          icon: const Icon(Icons.circle),
          title: language.status_preparing,
        ),
        EasyStep(
          icon: const Icon(Icons.circle),
          title: language.status_on_the_way,
          topTitle: true,
        ),
        EasyStep(
          icon: const Icon(Icons.circle),
          title: language.status_delivered,
        ),
      ],
    );
  }
}
