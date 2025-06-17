part of '../one_order_view.dart';

/// Order status progression widget using step indicator design
/// Displays the current order state and allows status changes through tap interaction
/// Provides visual feedback for order lifecycle from review to delivery
class _OrderStateSteps extends StatelessWidget {
  const _OrderStateSteps();

  @override
  Widget build(final BuildContext context) {
    final args = Provider.of<OrdersDatum>(context);
    final cubit = context.read<OrderStatusCubit>();
    // Convert order status enum to step index for visual progression
    final activeStep = args.status.enumToindex;
    final language = Language.of(context);

    return EasyStepper(
      // Current active step based on order status
      activeStep: activeStep,
      // Golden color scheme for active and completed steps
      activeStepTextColor: ColorManger.myGold,
      finishedStepTextColor: ColorManger.myGold,
      finishedStepIconColor: ColorManger.myGold,
      // Transparent for unreached steps
      unreachedStepIconColor: Colors.transparent,
      // Visual styling matching app design
      borderThickness: 2,
      stepBorderRadius: kNormalRadius,
      stepShape: StepShape.rRectangle,
      showLoadingAnimation: false,
      stepRadius: kNormalRadius.r,
      // Handle step tap for status change confirmation
      onStepReached: (final index) {
        showChangerPopUpConfirm(
          context: context,
          title: language.change_status,
          subtitle: language.are_you_sure_you_want_to_change_this_order_status,
          onPressed: () {
            // Change order status when user confirms
            cubit.changeStatus(
              index,
              args.status.enumToindex,
              args.id.toString(),
            );
          },
        );
      },
      // Define all possible order status steps
      steps: [
        // Step 1: Under Review
        EasyStep(icon: const Icon(Icons.circle), title: language.status_review),
        // Step 2: Approved
        EasyStep(
          icon: const Icon(Icons.circle),
          title: language.status_approved,
          topTitle: true,
        ),
        // Step 3: Preparing
        EasyStep(
          icon: const Icon(Icons.circle),
          title: language.status_preparing,
        ),
        // Step 4: On the Way
        EasyStep(
          icon: const Icon(Icons.circle),
          title: language.status_on_the_way,
          topTitle: true,
        ),
        // Step 5: Delivered
        EasyStep(
          icon: const Icon(Icons.circle),
          title: language.status_delivered,
        ),
      ],
    );
  }
}
