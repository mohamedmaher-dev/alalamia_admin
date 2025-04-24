import 'package:json_annotation/json_annotation.dart';

part 'unit_type.g.dart';

@JsonSerializable()
class UnitType {
  final int? id;
  final int? status;
  final String? actions;
  @JsonKey(name: 'background_color_row')
  final String? backgroundColorRow;
  final String? name;

  const UnitType({
    this.id,
    this.status,
    this.actions,
    this.backgroundColorRow,
    this.name,
  });

  factory UnitType.fromJson(Map<String, dynamic> json) =>
      _$UnitTypeFromJson(json);

  Map<String, dynamic> toJson() => _$UnitTypeToJson(this);
}
