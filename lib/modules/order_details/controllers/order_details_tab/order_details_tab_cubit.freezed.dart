// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_details_tab_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OrderDetailsTabState {
  OrderDetailsTabsModel get tab => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderDetailsTabsModel tab) change,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderDetailsTabsModel tab)? change,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderDetailsTabsModel tab)? change,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Change value) change,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Change value)? change,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Change value)? change,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of OrderDetailsTabState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderDetailsTabStateCopyWith<OrderDetailsTabState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailsTabStateCopyWith<$Res> {
  factory $OrderDetailsTabStateCopyWith(
    OrderDetailsTabState value,
    $Res Function(OrderDetailsTabState) then,
  ) = _$OrderDetailsTabStateCopyWithImpl<$Res, OrderDetailsTabState>;
  @useResult
  $Res call({OrderDetailsTabsModel tab});
}

/// @nodoc
class _$OrderDetailsTabStateCopyWithImpl<
  $Res,
  $Val extends OrderDetailsTabState
>
    implements $OrderDetailsTabStateCopyWith<$Res> {
  _$OrderDetailsTabStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderDetailsTabState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tab = null}) {
    return _then(
      _value.copyWith(
            tab:
                null == tab
                    ? _value.tab
                    : tab // ignore: cast_nullable_to_non_nullable
                        as OrderDetailsTabsModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChangeImplCopyWith<$Res>
    implements $OrderDetailsTabStateCopyWith<$Res> {
  factory _$$ChangeImplCopyWith(
    _$ChangeImpl value,
    $Res Function(_$ChangeImpl) then,
  ) = __$$ChangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OrderDetailsTabsModel tab});
}

/// @nodoc
class __$$ChangeImplCopyWithImpl<$Res>
    extends _$OrderDetailsTabStateCopyWithImpl<$Res, _$ChangeImpl>
    implements _$$ChangeImplCopyWith<$Res> {
  __$$ChangeImplCopyWithImpl(
    _$ChangeImpl _value,
    $Res Function(_$ChangeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderDetailsTabState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tab = null}) {
    return _then(
      _$ChangeImpl(
        tab:
            null == tab
                ? _value.tab
                : tab // ignore: cast_nullable_to_non_nullable
                    as OrderDetailsTabsModel,
      ),
    );
  }
}

/// @nodoc

class _$ChangeImpl implements _Change {
  const _$ChangeImpl({required this.tab});

  @override
  final OrderDetailsTabsModel tab;

  @override
  String toString() {
    return 'OrderDetailsTabState.change(tab: $tab)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeImpl &&
            (identical(other.tab, tab) || other.tab == tab));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tab);

  /// Create a copy of OrderDetailsTabState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeImplCopyWith<_$ChangeImpl> get copyWith =>
      __$$ChangeImplCopyWithImpl<_$ChangeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderDetailsTabsModel tab) change,
  }) {
    return change(tab);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderDetailsTabsModel tab)? change,
  }) {
    return change?.call(tab);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderDetailsTabsModel tab)? change,
    required TResult orElse(),
  }) {
    if (change != null) {
      return change(tab);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Change value) change,
  }) {
    return change(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Change value)? change,
  }) {
    return change?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Change value)? change,
    required TResult orElse(),
  }) {
    if (change != null) {
      return change(this);
    }
    return orElse();
  }
}

abstract class _Change implements OrderDetailsTabState {
  const factory _Change({required final OrderDetailsTabsModel tab}) =
      _$ChangeImpl;

  @override
  OrderDetailsTabsModel get tab;

  /// Create a copy of OrderDetailsTabState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeImplCopyWith<_$ChangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
