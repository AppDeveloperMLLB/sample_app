// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoApiModelImpl _$$TodoApiModelImplFromJson(Map<String, dynamic> json) =>
    _$TodoApiModelImpl(
      userId: (json['userId'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$$TodoApiModelImplToJson(_$TodoApiModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
