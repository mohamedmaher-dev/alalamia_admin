import 'package:json_annotation/json_annotation.dart';

part 'chart_labels.g.dart';

@JsonSerializable(createToJson: false)
class ChartLabels {
  @JsonKey(name: 'SUN')
  final String? sun;
  @JsonKey(name: 'MON')
  final String? mon;
  @JsonKey(name: 'TUE')
  final String? tue;
  @JsonKey(name: 'WED')
  final String? wed;
  @JsonKey(name: 'THU')
  final String? thu;
  @JsonKey(name: 'FRI')
  final String? fri;
  @JsonKey(name: 'SAT')
  final String? sat;

  const ChartLabels({
    this.sun,
    this.mon,
    this.tue,
    this.wed,
    this.thu,
    this.fri,
    this.sat,
  });

  factory ChartLabels.fromJson(Map<String, dynamic> json) {
    return _$ChartLabelsFromJson(json);
  }

  List<String> get days => [sun!, mon!, tue!, wed!, thu!, fri!, sat!];
}
