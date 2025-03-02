part of '../one_order_view.dart';

class _OrderStateSteps extends StatelessWidget {
  const _OrderStateSteps();

  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      defaultStepBorderType: BorderType.normal,
      finishedStepIconColor: ColorManger.black,
      activeStepIconColor: ColorManger.primary,
      unreachedStepIconColor: ColorManger.transparent,
      unreachedStepBorderColor: ColorManger.primary,
      borderThickness: 3,
      lineStyle: const LineStyle(lineType: LineType.dashed, lineThickness: 2),
      showLoadingAnimation: false,
      showTitle: false,
      stepBorderRadius: 10.r,
      stepShape: StepShape.rRectangle,
      activeStep: 1,
      steps: const [
        EasyStep(
          enabled: true,
          finishIcon: Icon(Icons.done),
          icon: Icon(Icons.circle_outlined),
        ),
        EasyStep(
          enabled: true,
          finishIcon: Icon(Icons.done),
          icon: Icon(Icons.circle_outlined),
        ),
        EasyStep(
          enabled: true,
          finishIcon: Icon(Icons.done),
          icon: Icon(Icons.circle_outlined),
        ),
      ],
    );
  }
}
