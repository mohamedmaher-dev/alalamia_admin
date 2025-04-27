// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitType _$UnitTypeFromJson(Map<String, dynamic> json) => UnitType(
  id: (json['id'] as num?)?.toInt(),
  status: (json['status'] as num?)?.toInt(),
  actions: json['actions'] as String?,
  backgroundColorRow: json['background_color_row'] as String?,
  name: json['name'] as String?,
);

Map<String, dynamic> _$UnitTypeToJson(UnitType instance) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'actions': instance.actions,
  'background_color_row': instance.backgroundColorRow,
  'name': instance.name,
};
