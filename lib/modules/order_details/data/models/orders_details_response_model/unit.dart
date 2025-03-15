import 'package:json_annotation/json_annotation.dart';

import 'unit_type.dart';

part 'unit.g.dart';

@JsonSerializable()
class Unit {
  final int? id;
  @JsonKey(name: 'unit_type_id')
  final int? unitTypeId;
  final int? status;
  final String? actions;
  @JsonKey(name: 'unit_type_name')
  final String? unitTypeName;
  @JsonKey(name: 'background_color_row')
  final String? backgroundColorRow;
  final String? name;
  @JsonKey(name: 'unit_type')
  final UnitType? unitType;

  const Unit({
    this.id,
    this.unitTypeId,
    this.status,
    this.actions,
    this.unitTypeName,
    this.backgroundColorRow,
    this.name,
    this.unitType,
  });

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);

  Map<String, dynamic> toJson() => _$UnitToJson(this);
}
