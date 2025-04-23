// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AppConfigModel _$AppConfigModelFromJson(Map<String, dynamic> json) {
  return _AppConfigModel.fromJson(json);
}

/// @nodoc
mixin _$AppConfigModel {
  bool get isDarkMode => throw _privateConstructorUsedError;
  bool get turnOnNotification => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;

  /// Serializes this AppConfigModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppConfigModelCopyWith<AppConfigModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigModelCopyWith<$Res> {
  factory $AppConfigModelCopyWith(
    AppConfigModel value,
    $Res Function(AppConfigModel) then,
  ) = _$AppConfigModelCopyWithImpl<$Res, AppConfigModel>;
  @useResult
  $Res call({bool isDarkMode, bool turnOnNotification, String language});
}

/// @nodoc
class _$AppConfigModelCopyWithImpl<$Res, $Val extends AppConfigModel>
    implements $AppConfigModelCopyWith<$Res> {
  _$AppConfigModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
    Object? turnOnNotification = null,
    Object? language = null,
  }) {
    return _then(
      _value.copyWith(
            isDarkMode:
                null == isDarkMode
                    ? _value.isDarkMode
                    : isDarkMode // ignore: cast_nullable_to_non_nullable
                        as bool,
            turnOnNotification:
                null == turnOnNotification
                    ? _value.turnOnNotification
                    : turnOnNotification // ignore: cast_nullable_to_non_nullable
                        as bool,
            language:
                null == language
                    ? _value.language
                    : language // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppConfigModelImplCopyWith<$Res>
    implements $AppConfigModelCopyWith<$Res> {
  factory _$$AppConfigModelImplCopyWith(
    _$AppConfigModelImpl value,
    $Res Function(_$AppConfigModelImpl) then,
  ) = __$$AppConfigModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode, bool turnOnNotification, String language});
}

/// @nodoc
class __$$AppConfigModelImplCopyWithImpl<$Res>
    extends _$AppConfigModelCopyWithImpl<$Res, _$AppConfigModelImpl>
    implements _$$AppConfigModelImplCopyWith<$Res> {
  __$$AppConfigModelImplCopyWithImpl(
    _$AppConfigModelImpl _value,
    $Res Function(_$AppConfigModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
    Object? turnOnNotification = null,
    Object? language = null,
  }) {
    return _then(
      _$AppConfigModelImpl(
        isDarkMode:
            null == isDarkMode
                ? _value.isDarkMode
                : isDarkMode // ignore: cast_nullable_to_non_nullable
                    as bool,
        turnOnNotification:
            null == turnOnNotification
                ? _value.turnOnNotification
                : turnOnNotification // ignore: cast_nullable_to_non_nullable
                    as bool,
        language:
            null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppConfigModelImpl implements _AppConfigModel {
  const _$AppConfigModelImpl({
    this.isDarkMode = true,
    this.turnOnNotification = true,
    this.language = 'ar',
  });

  factory _$AppConfigModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppConfigModelImplFromJson(json);

  @override
  @JsonKey()
  final bool isDarkMode;
  @override
  @JsonKey()
  final bool turnOnNotification;
  @override
  @JsonKey()
  final String language;

  @override
  String toString() {
    return 'AppConfigModel(isDarkMode: $isDarkMode, turnOnNotification: $turnOnNotification, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigModelImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode) &&
            (identical(other.turnOnNotification, turnOnNotification) ||
                other.turnOnNotification == turnOnNotification) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isDarkMode, turnOnNotification, language);

  /// Create a copy of AppConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigModelImplCopyWith<_$AppConfigModelImpl> get copyWith =>
      __$$AppConfigModelImplCopyWithImpl<_$AppConfigModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AppConfigModelImplToJson(this);
  }
}

abstract class _AppConfigModel implements AppConfigModel {
  const factory _AppConfigModel({
    final bool isDarkMode,
    final bool turnOnNotification,
    final String language,
  }) = _$AppConfigModelImpl;

  factory _AppConfigModel.fromJson(Map<String, dynamic> json) =
      _$AppConfigModelImpl.fromJson;

  @override
  bool get isDarkMode;
  @override
  bool get turnOnNotification;
  @override
  String get language;

  /// Create a copy of AppConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppConfigModelImplCopyWith<_$AppConfigModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
