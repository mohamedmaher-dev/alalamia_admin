import 'package:json_annotation/json_annotation.dart';

import 'unit_type.dart';

part 'unit.g.dart';

/// Unit model representing specific measurement units for products
/// Contains unit details and references to unit type categories
/// Used for displaying product quantities and measurements in orders
@JsonSerializable()
class Unit {
  /// Unique identifier for the unit record
  /// Used for database relationships and unit management operations
  final int? id;

  /// Foreign key reference to the unit type category
  /// Links this unit to its parent unit type (kg, piece, etc.)
  @JsonKey(name: 'unit_type_id')
  final int? unitTypeId;

  /// Status indicator for the unit (active/inactive)
  /// Determines if this unit is currently available for use
  final int? status;

  /// Available actions for this unit (JSON encoded permissions)
  /// Defines what operations can be performed with this unit
  final String? actions;

  /// Human-readable name of the unit type for quick reference
  /// Cached unit type name for display without additional queries
  @JsonKey(name: 'unit_type_name')
  final String? unitTypeName;

  /// Background color for UI display rows containing this unit
  /// Used for visual differentiation in tables and product lists
  @JsonKey(name: 'background_color_row')
  final String? backgroundColorRow;

  /// Specific name or label for this unit instance
  /// May be more specific than unit type (e.g., "Large Box", "Small Piece")
  final String? name;

  /// Complete unit type object with detailed information
  /// Contains full unit type data including categories and properties
  @JsonKey(name: 'unit_type')
  final UnitType? unitType;

  /// Creates a unit instance with measurement and display information
  /// All parameters are optional to handle various API response formats
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

  /// Factory constructor for creating Unit instance from JSON response
  /// Used by the API service to deserialize unit data from backend
  factory Unit.fromJson(final Map<String, dynamic> json) =>
      _$UnitFromJson(json);

  /// Converts unit instance to JSON for API requests
  /// Used when sending unit data to the backend
  Map<String, dynamic> toJson() => _$UnitToJson(this);
}
