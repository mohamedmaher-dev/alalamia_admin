import 'package:json_annotation/json_annotation.dart';

part 'chart_labels.g.dart';

/// Chart labels model containing localized day names for statistics visualization
/// Provides day labels for charts and analytics graphs in the user's language
/// Used to display appropriate day names in chart axes and legends
@JsonSerializable(createToJson: false)
class ChartLabels {
  /// Localized label for Sunday
  /// Used as the first day label in weekly charts and graphs
  @JsonKey(name: 'SUN')
  final String? sun;

  /// Localized label for Monday
  /// Used as the second day label in weekly charts and graphs
  @JsonKey(name: 'MON')
  final String? mon;

  /// Localized label for Tuesday
  /// Used as the third day label in weekly charts and graphs
  @JsonKey(name: 'TUE')
  final String? tue;

  /// Localized label for Wednesday
  /// Used as the fourth day label in weekly charts and graphs
  @JsonKey(name: 'WED')
  final String? wed;

  /// Localized label for Thursday
  /// Used as the fifth day label in weekly charts and graphs
  @JsonKey(name: 'THU')
  final String? thu;

  /// Localized label for Friday
  /// Used as the sixth day label in weekly charts and graphs
  @JsonKey(name: 'FRI')
  final String? fri;

  /// Localized label for Saturday
  /// Used as the seventh day label in weekly charts and graphs
  @JsonKey(name: 'SAT')
  final String? sat;

  /// Creates a chart labels instance with localized day names
  /// All day labels are optional to handle various server response formats
  const ChartLabels({
    this.sun,
    this.mon,
    this.tue,
    this.wed,
    this.thu,
    this.fri,
    this.sat,
  });

  /// Factory constructor for creating ChartLabels instance from JSON response
  /// Used by the API service to deserialize chart labels from backend
  factory ChartLabels.fromJson(final Map<String, dynamic> json) =>
      _$ChartLabelsFromJson(json);

  /// Getter that returns ordered list of all day labels for chart display
  /// Returns days starting from Sunday through Saturday for proper visualization
  /// Used by chart widgets to show correct day sequence on axes
  List<String> get days => [sun!, mon!, tue!, wed!, thu!, fri!, sat!];
}
