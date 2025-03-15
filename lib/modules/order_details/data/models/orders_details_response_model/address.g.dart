// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      id: (json['id'] as num?)?.toInt(),
      areaId: json['area_id'],
      location: (json['location'] as num?)?.toInt(),
      name: json['name'] as String?,
      desc: json['desc'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      favorated: (json['favorated'] as num?)?.toInt(),
      phone: (json['phone'] as num?)?.toInt(),
      backgroundColorRow: json['background_color_row'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'area_id': instance.areaId,
      'location': instance.location,
      'name': instance.name,
      'desc': instance.desc,
      'lat': instance.lat,
      'long': instance.long,
      'favorated': instance.favorated,
      'phone': instance.phone,
      'background_color_row': instance.backgroundColorRow,
    };
