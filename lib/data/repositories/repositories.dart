import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:sample_app/data/repositories/todo/todo_repository.dart";
import "package:sample_app/data/repositories/todo/todo_repository_remote.dart";
import "package:sample_app/data/services/api.dart";
import "package:sample_app/data/services/dio.dart";

part "repositories.g.dart";

@Riverpod()
TodoRepository todoRepository(Ref ref) {
  return TodoRepositoryRemote(Api(getDio()));
}
