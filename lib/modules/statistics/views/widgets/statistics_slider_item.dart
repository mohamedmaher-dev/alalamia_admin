part of '../statistics_view.dart';

class _StatSliderItem extends StatelessWidget {
  const _StatSliderItem({
    required this.value,
    required this.max,
    required this.color,
    required this.title,
    this.showIndicator = true,
  });
  final String title;
  final int value;
  final int max;
  final Color color;
  final bool showIndicator;

  @override
  Widget build(final BuildContext context) => SfRadialGauge(
    axes: <RadialAxis>[
      RadialAxis(
        maximum: max.toDouble(),
        axisLineStyle: AxisLineStyle(
          color: color.withAlpha(50),
          thickness: 0.25,
          thicknessUnit: GaugeSizeUnit.factor,
        ),
        showLabels: false,
        showTicks: false,
        startAngle: 90,
        endAngle: 90,
        pointers: <GaugePointer>[
          RangePointer(
            width: 0.25,
            value: value.toDouble(),
            cornerStyle:
                showIndicator ? CornerStyle.bothCurve : CornerStyle.bothFlat,
            color: color,
            sizeUnit: GaugeSizeUnit.factor,
            enableAnimation: showIndicator,
          ),
          if (showIndicator)
            MarkerPointer(
              value: value.toDouble(),
              elevation: 5,
              color: color,
              markerHeight: 25.h,
              markerWidth: 25.h,
              markerType: MarkerType.circle,
              enableAnimation: showIndicator,
            ),
        ],
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
            widget: ListTile(
              title: Text(
                textAlign: TextAlign.center,
                value.toString(),
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                textAlign: TextAlign.center,
                title,
                style: const TextStyle(),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
