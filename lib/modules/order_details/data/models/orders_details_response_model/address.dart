import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  final int? id;
  @JsonKey(name: 'area_id')
  final dynamic areaId;
  final int? location;
  final String? name;
  final String? desc;
  final String? lat;
  final String? long;
  final int? favorated;
  final int? phone;
  @JsonKey(name: 'background_color_row')
  final String? backgroundColorRow;

  const Address({
    this.id,
    this.areaId,
    this.location,
    this.name,
    this.desc,
    this.lat,
    this.long,
    this.favorated,
    this.phone,
    this.backgroundColorRow,
  });

  factory Address.fromJson(final Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  ({double lat, double long}) get latLong => (
    lat: double.parse(lat!),
    long: double.parse(long!),
  );
}
