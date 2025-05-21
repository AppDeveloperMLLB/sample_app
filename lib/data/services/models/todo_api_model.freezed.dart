// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodoApiModel _$TodoApiModelFromJson(Map<String, dynamic> json) {
  return _TodoApiModel.fromJson(json);
}

/// @nodoc
mixin _$TodoApiModel {
  int get userId => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;

  /// Serializes this TodoApiModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodoApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoApiModelCopyWith<TodoApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoApiModelCopyWith<$Res> {
  factory $TodoApiModelCopyWith(
          TodoApiModel value, $Res Function(TodoApiModel) then) =
      _$TodoApiModelCopyWithImpl<$Res, TodoApiModel>;
  @useResult
  $Res call({int userId, int id, String title, bool completed});
}

/// @nodoc
class _$TodoApiModelCopyWithImpl<$Res, $Val extends TodoApiModel>
    implements $TodoApiModelCopyWith<$Res> {
  _$TodoApiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? id = null,
    Object? title = null,
    Object? completed = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoApiModelImplCopyWith<$Res>
    implements $TodoApiModelCopyWith<$Res> {
  factory _$$TodoApiModelImplCopyWith(
          _$TodoApiModelImpl value, $Res Function(_$TodoApiModelImpl) then) =
      __$$TodoApiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId, int id, String title, bool completed});
}

/// @nodoc
class __$$TodoApiModelImplCopyWithImpl<$Res>
    extends _$TodoApiModelCopyWithImpl<$Res, _$TodoApiModelImpl>
    implements _$$TodoApiModelImplCopyWith<$Res> {
  __$$TodoApiModelImplCopyWithImpl(
      _$TodoApiModelImpl _value, $Res Function(_$TodoApiModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodoApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? id = null,
    Object? title = null,
    Object? completed = null,
  }) {
    return _then(_$TodoApiModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoApiModelImpl implements _TodoApiModel {
  const _$TodoApiModelImpl(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  factory _$TodoApiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoApiModelImplFromJson(json);

  @override
  final int userId;
  @override
  final int id;
  @override
  final String title;
  @override
  final bool completed;

  @override
  String toString() {
    return 'TodoApiModel(userId: $userId, id: $id, title: $title, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoApiModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, id, title, completed);

  /// Create a copy of TodoApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoApiModelImplCopyWith<_$TodoApiModelImpl> get copyWith =>
      __$$TodoApiModelImplCopyWithImpl<_$TodoApiModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoApiModelImplToJson(
      this,
    );
  }
}

abstract class _TodoApiModel implements TodoApiModel {
  const factory _TodoApiModel(
      {required final int userId,
      required final int id,
      required final String title,
      required final bool completed}) = _$TodoApiModelImpl;

  factory _TodoApiModel.fromJson(Map<String, dynamic> json) =
      _$TodoApiModelImpl.fromJson;

  @override
  int get userId;
  @override
  int get id;
  @override
  String get title;
  @override
  bool get completed;

  /// Create a copy of TodoApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoApiModelImplCopyWith<_$TodoApiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
