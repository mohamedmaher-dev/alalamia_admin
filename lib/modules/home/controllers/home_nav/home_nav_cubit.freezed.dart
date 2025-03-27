// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_nav_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeNavState {
  HomePages get page => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HomePages page) currentPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HomePages page)? currentPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomePages page)? currentPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CurrentPage value) currentPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CurrentPage value)? currentPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CurrentPage value)? currentPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of HomeNavState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeNavStateCopyWith<HomeNavState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeNavStateCopyWith<$Res> {
  factory $HomeNavStateCopyWith(
          HomeNavState value, $Res Function(HomeNavState) then) =
      _$HomeNavStateCopyWithImpl<$Res, HomeNavState>;
  @useResult
  $Res call({HomePages page});
}

/// @nodoc
class _$HomeNavStateCopyWithImpl<$Res, $Val extends HomeNavState>
    implements $HomeNavStateCopyWith<$Res> {
  _$HomeNavStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeNavState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as HomePages,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentPageImplCopyWith<$Res>
    implements $HomeNavStateCopyWith<$Res> {
  factory _$$CurrentPageImplCopyWith(
          _$CurrentPageImpl value, $Res Function(_$CurrentPageImpl) then) =
      __$$CurrentPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HomePages page});
}

/// @nodoc
class __$$CurrentPageImplCopyWithImpl<$Res>
    extends _$HomeNavStateCopyWithImpl<$Res, _$CurrentPageImpl>
    implements _$$CurrentPageImplCopyWith<$Res> {
  __$$CurrentPageImplCopyWithImpl(
      _$CurrentPageImpl _value, $Res Function(_$CurrentPageImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeNavState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$CurrentPageImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as HomePages,
    ));
  }
}

/// @nodoc

class _$CurrentPageImpl implements _CurrentPage {
  const _$CurrentPageImpl({required this.page});

  @override
  final HomePages page;

  @override
  String toString() {
    return 'HomeNavState.currentPage(page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentPageImpl &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  /// Create a copy of HomeNavState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentPageImplCopyWith<_$CurrentPageImpl> get copyWith =>
      __$$CurrentPageImplCopyWithImpl<_$CurrentPageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HomePages page) currentPage,
  }) {
    return currentPage(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HomePages page)? currentPage,
  }) {
    return currentPage?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomePages page)? currentPage,
    required TResult orElse(),
  }) {
    if (currentPage != null) {
      return currentPage(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CurrentPage value) currentPage,
  }) {
    return currentPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CurrentPage value)? currentPage,
  }) {
    return currentPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CurrentPage value)? currentPage,
    required TResult orElse(),
  }) {
    if (currentPage != null) {
      return currentPage(this);
    }
    return orElse();
  }
}

abstract class _CurrentPage implements HomeNavState {
  const factory _CurrentPage({required final HomePages page}) =
      _$CurrentPageImpl;

  @override
  HomePages get page;

  /// Create a copy of HomeNavState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrentPageImplCopyWith<_$CurrentPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
