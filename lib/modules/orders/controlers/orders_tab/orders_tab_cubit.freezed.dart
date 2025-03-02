// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_tab_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrdersTabState {
  int get index => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) newTab,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? newTab,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? newTab,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NewTab value) newTab,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NewTab value)? newTab,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NewTab value)? newTab,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of OrdersTabState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrdersTabStateCopyWith<OrdersTabState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersTabStateCopyWith<$Res> {
  factory $OrdersTabStateCopyWith(
          OrdersTabState value, $Res Function(OrdersTabState) then) =
      _$OrdersTabStateCopyWithImpl<$Res, OrdersTabState>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class _$OrdersTabStateCopyWithImpl<$Res, $Val extends OrdersTabState>
    implements $OrdersTabStateCopyWith<$Res> {
  _$OrdersTabStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrdersTabState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewTabImplCopyWith<$Res>
    implements $OrdersTabStateCopyWith<$Res> {
  factory _$$NewTabImplCopyWith(
          _$NewTabImpl value, $Res Function(_$NewTabImpl) then) =
      __$$NewTabImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$NewTabImplCopyWithImpl<$Res>
    extends _$OrdersTabStateCopyWithImpl<$Res, _$NewTabImpl>
    implements _$$NewTabImplCopyWith<$Res> {
  __$$NewTabImplCopyWithImpl(
      _$NewTabImpl _value, $Res Function(_$NewTabImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrdersTabState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$NewTabImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NewTabImpl implements _NewTab {
  const _$NewTabImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'OrdersTabState.newTab(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewTabImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of OrdersTabState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewTabImplCopyWith<_$NewTabImpl> get copyWith =>
      __$$NewTabImplCopyWithImpl<_$NewTabImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) newTab,
  }) {
    return newTab(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? newTab,
  }) {
    return newTab?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? newTab,
    required TResult orElse(),
  }) {
    if (newTab != null) {
      return newTab(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NewTab value) newTab,
  }) {
    return newTab(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NewTab value)? newTab,
  }) {
    return newTab?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NewTab value)? newTab,
    required TResult orElse(),
  }) {
    if (newTab != null) {
      return newTab(this);
    }
    return orElse();
  }
}

abstract class _NewTab implements OrdersTabState {
  const factory _NewTab({required final int index}) = _$NewTabImpl;

  @override
  int get index;

  /// Create a copy of OrdersTabState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewTabImplCopyWith<_$NewTabImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
