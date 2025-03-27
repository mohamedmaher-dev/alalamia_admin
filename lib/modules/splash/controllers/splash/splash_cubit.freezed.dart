// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SplashState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() noCredential,
    required TResult Function() successToLogin,
    required TResult Function() failedToLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? noCredential,
    TResult? Function()? successToLogin,
    TResult? Function()? failedToLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? noCredential,
    TResult Function()? successToLogin,
    TResult Function()? failedToLogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NoCredential value) noCredential,
    required TResult Function(_SuccessToLogin value) successToLogin,
    required TResult Function(_FailedToLogin value) failedToLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NoCredential value)? noCredential,
    TResult? Function(_SuccessToLogin value)? successToLogin,
    TResult? Function(_FailedToLogin value)? failedToLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NoCredential value)? noCredential,
    TResult Function(_SuccessToLogin value)? successToLogin,
    TResult Function(_FailedToLogin value)? failedToLogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashStateCopyWith<$Res> {
  factory $SplashStateCopyWith(
          SplashState value, $Res Function(SplashState) then) =
      _$SplashStateCopyWithImpl<$Res, SplashState>;
}

/// @nodoc
class _$SplashStateCopyWithImpl<$Res, $Val extends SplashState>
    implements $SplashStateCopyWith<$Res> {
  _$SplashStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SplashState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() noCredential,
    required TResult Function() successToLogin,
    required TResult Function() failedToLogin,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? noCredential,
    TResult? Function()? successToLogin,
    TResult? Function()? failedToLogin,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? noCredential,
    TResult Function()? successToLogin,
    TResult Function()? failedToLogin,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NoCredential value) noCredential,
    required TResult Function(_SuccessToLogin value) successToLogin,
    required TResult Function(_FailedToLogin value) failedToLogin,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NoCredential value)? noCredential,
    TResult? Function(_SuccessToLogin value)? successToLogin,
    TResult? Function(_FailedToLogin value)? failedToLogin,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NoCredential value)? noCredential,
    TResult Function(_SuccessToLogin value)? successToLogin,
    TResult Function(_FailedToLogin value)? failedToLogin,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SplashState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$NoCredentialImplCopyWith<$Res> {
  factory _$$NoCredentialImplCopyWith(
          _$NoCredentialImpl value, $Res Function(_$NoCredentialImpl) then) =
      __$$NoCredentialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoCredentialImplCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$NoCredentialImpl>
    implements _$$NoCredentialImplCopyWith<$Res> {
  __$$NoCredentialImplCopyWithImpl(
      _$NoCredentialImpl _value, $Res Function(_$NoCredentialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NoCredentialImpl implements _NoCredential {
  const _$NoCredentialImpl();

  @override
  String toString() {
    return 'SplashState.noCredential()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoCredentialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() noCredential,
    required TResult Function() successToLogin,
    required TResult Function() failedToLogin,
  }) {
    return noCredential();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? noCredential,
    TResult? Function()? successToLogin,
    TResult? Function()? failedToLogin,
  }) {
    return noCredential?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? noCredential,
    TResult Function()? successToLogin,
    TResult Function()? failedToLogin,
    required TResult orElse(),
  }) {
    if (noCredential != null) {
      return noCredential();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NoCredential value) noCredential,
    required TResult Function(_SuccessToLogin value) successToLogin,
    required TResult Function(_FailedToLogin value) failedToLogin,
  }) {
    return noCredential(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NoCredential value)? noCredential,
    TResult? Function(_SuccessToLogin value)? successToLogin,
    TResult? Function(_FailedToLogin value)? failedToLogin,
  }) {
    return noCredential?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NoCredential value)? noCredential,
    TResult Function(_SuccessToLogin value)? successToLogin,
    TResult Function(_FailedToLogin value)? failedToLogin,
    required TResult orElse(),
  }) {
    if (noCredential != null) {
      return noCredential(this);
    }
    return orElse();
  }
}

abstract class _NoCredential implements SplashState {
  const factory _NoCredential() = _$NoCredentialImpl;
}

/// @nodoc
abstract class _$$SuccessToLoginImplCopyWith<$Res> {
  factory _$$SuccessToLoginImplCopyWith(_$SuccessToLoginImpl value,
          $Res Function(_$SuccessToLoginImpl) then) =
      __$$SuccessToLoginImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessToLoginImplCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$SuccessToLoginImpl>
    implements _$$SuccessToLoginImplCopyWith<$Res> {
  __$$SuccessToLoginImplCopyWithImpl(
      _$SuccessToLoginImpl _value, $Res Function(_$SuccessToLoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessToLoginImpl implements _SuccessToLogin {
  const _$SuccessToLoginImpl();

  @override
  String toString() {
    return 'SplashState.successToLogin()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessToLoginImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() noCredential,
    required TResult Function() successToLogin,
    required TResult Function() failedToLogin,
  }) {
    return successToLogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? noCredential,
    TResult? Function()? successToLogin,
    TResult? Function()? failedToLogin,
  }) {
    return successToLogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? noCredential,
    TResult Function()? successToLogin,
    TResult Function()? failedToLogin,
    required TResult orElse(),
  }) {
    if (successToLogin != null) {
      return successToLogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NoCredential value) noCredential,
    required TResult Function(_SuccessToLogin value) successToLogin,
    required TResult Function(_FailedToLogin value) failedToLogin,
  }) {
    return successToLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NoCredential value)? noCredential,
    TResult? Function(_SuccessToLogin value)? successToLogin,
    TResult? Function(_FailedToLogin value)? failedToLogin,
  }) {
    return successToLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NoCredential value)? noCredential,
    TResult Function(_SuccessToLogin value)? successToLogin,
    TResult Function(_FailedToLogin value)? failedToLogin,
    required TResult orElse(),
  }) {
    if (successToLogin != null) {
      return successToLogin(this);
    }
    return orElse();
  }
}

abstract class _SuccessToLogin implements SplashState {
  const factory _SuccessToLogin() = _$SuccessToLoginImpl;
}

/// @nodoc
abstract class _$$FailedToLoginImplCopyWith<$Res> {
  factory _$$FailedToLoginImplCopyWith(
          _$FailedToLoginImpl value, $Res Function(_$FailedToLoginImpl) then) =
      __$$FailedToLoginImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FailedToLoginImplCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$FailedToLoginImpl>
    implements _$$FailedToLoginImplCopyWith<$Res> {
  __$$FailedToLoginImplCopyWithImpl(
      _$FailedToLoginImpl _value, $Res Function(_$FailedToLoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FailedToLoginImpl implements _FailedToLogin {
  const _$FailedToLoginImpl();

  @override
  String toString() {
    return 'SplashState.failedToLogin()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FailedToLoginImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() noCredential,
    required TResult Function() successToLogin,
    required TResult Function() failedToLogin,
  }) {
    return failedToLogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? noCredential,
    TResult? Function()? successToLogin,
    TResult? Function()? failedToLogin,
  }) {
    return failedToLogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? noCredential,
    TResult Function()? successToLogin,
    TResult Function()? failedToLogin,
    required TResult orElse(),
  }) {
    if (failedToLogin != null) {
      return failedToLogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NoCredential value) noCredential,
    required TResult Function(_SuccessToLogin value) successToLogin,
    required TResult Function(_FailedToLogin value) failedToLogin,
  }) {
    return failedToLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NoCredential value)? noCredential,
    TResult? Function(_SuccessToLogin value)? successToLogin,
    TResult? Function(_FailedToLogin value)? failedToLogin,
  }) {
    return failedToLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NoCredential value)? noCredential,
    TResult Function(_SuccessToLogin value)? successToLogin,
    TResult Function(_FailedToLogin value)? failedToLogin,
    required TResult orElse(),
  }) {
    if (failedToLogin != null) {
      return failedToLogin(this);
    }
    return orElse();
  }
}

abstract class _FailedToLogin implements SplashState {
  const factory _FailedToLogin() = _$FailedToLoginImpl;
}
