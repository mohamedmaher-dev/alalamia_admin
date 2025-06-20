part of '../statistics_view.dart';

/// Circular gauge widget for displaying individual statistics values
/// Creates an animated radial progress indicator with value and label
/// Used in statistics dashboard to show order counts by status
class _StatSliderItem extends StatelessWidget {
  const _StatSliderItem({
    required this.value,
    required this.max,
    required this.color,
    required this.title,
    this.showIndicator = true,
  });

  /// Display title/label for the statistic (e.g., "Pending Orders")
  final String title;

  /// Current value to display in the gauge
  final int value;

  /// Maximum value for the gauge scale
  final int max;

  /// Color theme for the gauge (progress bar and marker)
  final Color color;

  /// Whether to show animated indicator marker at current value
  final bool showIndicator;

  @override
  Widget build(final BuildContext context) => SfRadialGauge(
    axes: <RadialAxis>[
      RadialAxis(
        // Set maximum value for the gauge scale
        maximum: max.toDouble(),
        // Background track styling with semi-transparent color
        axisLineStyle: AxisLineStyle(
          color: color.withAlpha(50),
          thickness: 0.25,
          thicknessUnit: GaugeSizeUnit.factor,
        ),
        // Hide default labels and ticks for cleaner appearance
        showLabels: false,
        showTicks: false,
        // Full circle gauge (270° arc)
        startAngle: 90,
        endAngle: 90,
        pointers: <GaugePointer>[
          // Progress bar pointer showing current value
          RangePointer(
            width: 0.25,
            value: value.toDouble(),
            // Curved corners if indicator enabled, flat if disabled
            cornerStyle:
                showIndicator ? CornerStyle.bothCurve : CornerStyle.bothFlat,
            color: color,
            sizeUnit: GaugeSizeUnit.factor,
            enableAnimation: showIndicator,
          ),
          // Optional circular marker at current value position
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
          // Center annotation with value and title
          GaugeAnnotation(
            widget: ListTile(
              // Large bold number displaying current value
              title: Text(
                textAlign: TextAlign.center,
                value.toString(),
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
              ),
              // Subtitle with descriptive title
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
