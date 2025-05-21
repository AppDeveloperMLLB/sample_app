// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginPageState {
  bool get isLoading => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  /// Create a copy of LoginPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginPageStateCopyWith<LoginPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginPageStateCopyWith<$Res> {
  factory $LoginPageStateCopyWith(
          LoginPageState value, $Res Function(LoginPageState) then) =
      _$LoginPageStateCopyWithImpl<$Res, LoginPageState>;
  @useResult
  $Res call({bool isLoading, Exception? error});
}

/// @nodoc
class _$LoginPageStateCopyWithImpl<$Res, $Val extends LoginPageState>
    implements $LoginPageStateCopyWith<$Res> {
  _$LoginPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginPageStateImplCopyWith<$Res>
    implements $LoginPageStateCopyWith<$Res> {
  factory _$$LoginPageStateImplCopyWith(_$LoginPageStateImpl value,
          $Res Function(_$LoginPageStateImpl) then) =
      __$$LoginPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, Exception? error});
}

/// @nodoc
class __$$LoginPageStateImplCopyWithImpl<$Res>
    extends _$LoginPageStateCopyWithImpl<$Res, _$LoginPageStateImpl>
    implements _$$LoginPageStateImplCopyWith<$Res> {
  __$$LoginPageStateImplCopyWithImpl(
      _$LoginPageStateImpl _value, $Res Function(_$LoginPageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$LoginPageStateImpl(
      null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$LoginPageStateImpl extends _LoginPageState {
  const _$LoginPageStateImpl([this.isLoading = false, this.error]) : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final Exception? error;

  @override
  String toString() {
    return 'LoginPageState(isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginPageStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error);

  /// Create a copy of LoginPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginPageStateImplCopyWith<_$LoginPageStateImpl> get copyWith =>
      __$$LoginPageStateImplCopyWithImpl<_$LoginPageStateImpl>(
          this, _$identity);
}

abstract class _LoginPageState extends LoginPageState {
  const factory _LoginPageState(
      [final bool isLoading, final Exception? error]) = _$LoginPageStateImpl;
  const _LoginPageState._() : super._();

  @override
  bool get isLoading;
  @override
  Exception? get error;

  /// Create a copy of LoginPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginPageStateImplCopyWith<_$LoginPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
