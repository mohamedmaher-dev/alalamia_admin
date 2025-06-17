import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

/// Address model representing customer delivery location information
/// Contains complete address details including geographic coordinates
/// Used for order delivery management and map integration
@JsonSerializable()
class Address {
  /// Unique identifier for the address record
  /// Used for database relationships and address management
  final int? id;

  /// Area identifier (can be int or string based on backend implementation)
  /// Links the address to a specific delivery area or zone
  @JsonKey(name: 'area_id')
  final dynamic areaId;

  /// Location type or category identifier
  /// May represent building type (home, office, etc.)
  final int? location;

  /// Address name or label (e.g., "Home", "Office", "Shop")
  /// User-friendly name for easy address identification
  final String? name;

  /// Detailed address description or street address
  /// Contains full address text for delivery instructions
  final String? desc;

  /// Latitude coordinate as string for precise location
  /// Used for GPS navigation and map display
  final String? lat;

  /// Longitude coordinate as string for precise location
  /// Used for GPS navigation and map display
  final String? long;

  /// Favorite status indicator (1 if favorited, 0 otherwise)
  /// Allows customers to mark frequently used addresses
  final int? favorated;

  /// Contact phone number for delivery location
  /// Used by delivery personnel to contact customer
  final int? phone;

  /// Background color for UI display rows containing this address
  /// Used for visual differentiation in address lists
  @JsonKey(name: 'background_color_row')
  final String? backgroundColorRow;

  /// Creates an address instance with location and contact information
  /// All parameters are optional to handle various API response formats
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

  /// Factory constructor for creating Address instance from JSON response
  /// Used by the API service to deserialize address data from backend
  factory Address.fromJson(final Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  /// Converts address instance to JSON for API requests
  /// Used when sending address data to the backend
  Map<String, dynamic> toJson() => _$AddressToJson(this);

  /// Getter that returns parsed latitude and longitude as double values
  /// Converts string coordinates to proper numeric types for map libraries
  /// Returns a record with lat and long fields for easy destructuring
  ({double lat, double long}) get latLong => (
    lat: double.parse(lat!),
    long: double.parse(long!),
  );
}
