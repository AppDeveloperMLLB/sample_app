import 'package:freezed_annotation/freezed_annotation.dart';

part "todo_api_model.freezed.dart";
part "todo_api_model.g.dart";

// "userId": 1,
//   "id": 1,
//   "title": "delectus aut autem",
//   "completed": false

@freezed
abstract class TodoApiModel with _$TodoApiModel {
  const factory TodoApiModel({
    required int userId,
    required int id,
    required String title,
    required bool completed,
  }) = _TodoApiModel;

  factory TodoApiModel.fromJson(Map<String, Object?> json) =>
      _$TodoApiModelFromJson(json);
}
