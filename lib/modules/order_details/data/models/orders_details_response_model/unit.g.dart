// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Unit _$UnitFromJson(Map<String, dynamic> json) => Unit(
  id: (json['id'] as num?)?.toInt(),
  unitTypeId: (json['unit_type_id'] as num?)?.toInt(),
  status: (json['status'] as num?)?.toInt(),
  actions: json['actions'] as String?,
  unitTypeName: json['unit_type_name'] as String?,
  backgroundColorRow: json['background_color_row'] as String?,
  name: json['name'] as String?,
  unitType:
      json['unit_type'] == null
          ? null
          : UnitType.fromJson(json['unit_type'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UnitToJson(Unit instance) => <String, dynamic>{
  'id': instance.id,
  'unit_type_id': instance.unitTypeId,
  'status': instance.status,
  'actions': instance.actions,
  'unit_type_name': instance.unitTypeName,
  'background_color_row': instance.backgroundColorRow,
  'name': instance.name,
  'unit_type': instance.unitType,
};
