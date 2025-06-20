import 'package:json_annotation/json_annotation.dart';

part 'unit_type.g.dart';

/// Unit type model representing product measurement unit categories
/// Defines how products are measured and sold (kg, piece, box, etc.)
/// Used for displaying proper unit labels in order details and cart items
@JsonSerializable()
class UnitType {
  /// Unique identifier for the unit type
  /// Used for database relationships and API operations
  final int? id;

  /// Status indicator for the unit type (active/inactive)
  /// Determines if this unit type is currently available for use
  final int? status;

  /// Available actions for this unit type (JSON encoded permissions)
  /// Defines what operations can be performed with this unit type
  final String? actions;

  /// Background color for UI display rows containing this unit type
  /// Used for visual differentiation in tables and lists
  @JsonKey(name: 'background_color_row')
  final String? backgroundColorRow;

  /// Human-readable name of the unit type (kg, piece, box, liter, etc.)
  /// Displayed to users in product descriptions and order summaries
  final String? name;

  /// Creates a unit type instance with measurement unit information
  /// All parameters are optional to handle various API response formats
  const UnitType({
    this.id,
    this.status,
    this.actions,
    this.backgroundColorRow,
    this.name,
  });

  /// Factory constructor for creating UnitType instance from JSON response
  /// Used by the API service to deserialize unit type data from backend
  factory UnitType.fromJson(final Map<String, dynamic> json) =>
      _$UnitTypeFromJson(json);

  /// Converts unit type instance to JSON for API requests
  /// Used when sending unit type data to the backend
  Map<String, dynamic> toJson() => _$UnitTypeToJson(this);
}
