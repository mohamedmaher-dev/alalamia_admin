// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OrdersSearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() disabled,
    required TResult Function(List<OrdersDatum> orders) enabled,
    required TResult Function() empty,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? disabled,
    TResult? Function(List<OrdersDatum> orders)? enabled,
    TResult? Function()? empty,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? disabled,
    TResult Function(List<OrdersDatum> orders)? enabled,
    TResult Function()? empty,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DisabledMode value) disabled,
    required TResult Function(EnabledMode value) enabled,
    required TResult Function(EmptyMode value) empty,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DisabledMode value)? disabled,
    TResult? Function(EnabledMode value)? enabled,
    TResult? Function(EmptyMode value)? empty,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DisabledMode value)? disabled,
    TResult Function(EnabledMode value)? enabled,
    TResult Function(EmptyMode value)? empty,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersSearchStateCopyWith<$Res> {
  factory $OrdersSearchStateCopyWith(
    OrdersSearchState value,
    $Res Function(OrdersSearchState) then,
  ) = _$OrdersSearchStateCopyWithImpl<$Res, OrdersSearchState>;
}

/// @nodoc
class _$OrdersSearchStateCopyWithImpl<$Res, $Val extends OrdersSearchState>
    implements $OrdersSearchStateCopyWith<$Res> {
  _$OrdersSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrdersSearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DisabledModeImplCopyWith<$Res> {
  factory _$$DisabledModeImplCopyWith(
    _$DisabledModeImpl value,
    $Res Function(_$DisabledModeImpl) then,
  ) = __$$DisabledModeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DisabledModeImplCopyWithImpl<$Res>
    extends _$OrdersSearchStateCopyWithImpl<$Res, _$DisabledModeImpl>
    implements _$$DisabledModeImplCopyWith<$Res> {
  __$$DisabledModeImplCopyWithImpl(
    _$DisabledModeImpl _value,
    $Res Function(_$DisabledModeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrdersSearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DisabledModeImpl implements DisabledMode {
  const _$DisabledModeImpl();

  @override
  String toString() {
    return 'OrdersSearchState.disabled()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DisabledModeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() disabled,
    required TResult Function(List<OrdersDatum> orders) enabled,
    required TResult Function() empty,
  }) {
    return disabled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? disabled,
    TResult? Function(List<OrdersDatum> orders)? enabled,
    TResult? Function()? empty,
  }) {
    return disabled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? disabled,
    TResult Function(List<OrdersDatum> orders)? enabled,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (disabled != null) {
      return disabled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DisabledMode value) disabled,
    required TResult Function(EnabledMode value) enabled,
    required TResult Function(EmptyMode value) empty,
  }) {
    return disabled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DisabledMode value)? disabled,
    TResult? Function(EnabledMode value)? enabled,
    TResult? Function(EmptyMode value)? empty,
  }) {
    return disabled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DisabledMode value)? disabled,
    TResult Function(EnabledMode value)? enabled,
    TResult Function(EmptyMode value)? empty,
    required TResult orElse(),
  }) {
    if (disabled != null) {
      return disabled(this);
    }
    return orElse();
  }
}

abstract class DisabledMode implements OrdersSearchState {
  const factory DisabledMode() = _$DisabledModeImpl;
}

/// @nodoc
abstract class _$$EnabledModeImplCopyWith<$Res> {
  factory _$$EnabledModeImplCopyWith(
    _$EnabledModeImpl value,
    $Res Function(_$EnabledModeImpl) then,
  ) = __$$EnabledModeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<OrdersDatum> orders});
}

/// @nodoc
class __$$EnabledModeImplCopyWithImpl<$Res>
    extends _$OrdersSearchStateCopyWithImpl<$Res, _$EnabledModeImpl>
    implements _$$EnabledModeImplCopyWith<$Res> {
  __$$EnabledModeImplCopyWithImpl(
    _$EnabledModeImpl _value,
    $Res Function(_$EnabledModeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrdersSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orders = null}) {
    return _then(
      _$EnabledModeImpl(
        orders: null == orders
            ? _value._orders
            : orders // ignore: cast_nullable_to_non_nullable
                  as List<OrdersDatum>,
      ),
    );
  }
}

/// @nodoc

class _$EnabledModeImpl implements EnabledMode {
  const _$EnabledModeImpl({required final List<OrdersDatum> orders})
    : _orders = orders;

  final List<OrdersDatum> _orders;
  @override
  List<OrdersDatum> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  String toString() {
    return 'OrdersSearchState.enabled(orders: $orders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnabledModeImpl &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_orders));

  /// Create a copy of OrdersSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnabledModeImplCopyWith<_$EnabledModeImpl> get copyWith =>
      __$$EnabledModeImplCopyWithImpl<_$EnabledModeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() disabled,
    required TResult Function(List<OrdersDatum> orders) enabled,
    required TResult Function() empty,
  }) {
    return enabled(orders);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? disabled,
    TResult? Function(List<OrdersDatum> orders)? enabled,
    TResult? Function()? empty,
  }) {
    return enabled?.call(orders);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? disabled,
    TResult Function(List<OrdersDatum> orders)? enabled,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (enabled != null) {
      return enabled(orders);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DisabledMode value) disabled,
    required TResult Function(EnabledMode value) enabled,
    required TResult Function(EmptyMode value) empty,
  }) {
    return enabled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DisabledMode value)? disabled,
    TResult? Function(EnabledMode value)? enabled,
    TResult? Function(EmptyMode value)? empty,
  }) {
    return enabled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DisabledMode value)? disabled,
    TResult Function(EnabledMode value)? enabled,
    TResult Function(EmptyMode value)? empty,
    required TResult orElse(),
  }) {
    if (enabled != null) {
      return enabled(this);
    }
    return orElse();
  }
}

abstract class EnabledMode implements OrdersSearchState {
  const factory EnabledMode({required final List<OrdersDatum> orders}) =
      _$EnabledModeImpl;

  List<OrdersDatum> get orders;

  /// Create a copy of OrdersSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnabledModeImplCopyWith<_$EnabledModeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyModeImplCopyWith<$Res> {
  factory _$$EmptyModeImplCopyWith(
    _$EmptyModeImpl value,
    $Res Function(_$EmptyModeImpl) then,
  ) = __$$EmptyModeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyModeImplCopyWithImpl<$Res>
    extends _$OrdersSearchStateCopyWithImpl<$Res, _$EmptyModeImpl>
    implements _$$EmptyModeImplCopyWith<$Res> {
  __$$EmptyModeImplCopyWithImpl(
    _$EmptyModeImpl _value,
    $Res Function(_$EmptyModeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrdersSearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EmptyModeImpl implements EmptyMode {
  const _$EmptyModeImpl();

  @override
  String toString() {
    return 'OrdersSearchState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyModeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() disabled,
    required TResult Function(List<OrdersDatum> orders) enabled,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? disabled,
    TResult? Function(List<OrdersDatum> orders)? enabled,
    TResult? Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? disabled,
    TResult Function(List<OrdersDatum> orders)? enabled,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DisabledMode value) disabled,
    required TResult Function(EnabledMode value) enabled,
    required TResult Function(EmptyMode value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DisabledMode value)? disabled,
    TResult? Function(EnabledMode value)? enabled,
    TResult? Function(EmptyMode value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DisabledMode value)? disabled,
    TResult Function(EnabledMode value)? enabled,
    TResult Function(EmptyMode value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class EmptyMode implements OrdersSearchState {
  const factory EmptyMode() = _$EmptyModeImpl;
}
