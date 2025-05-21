import "package:sample_app/data/repositories/todo/todo_repository.dart";
import "package:sample_app/data/services/api.dart";
import "package:sample_app/domain/models/todo.dart";

class TodoRepositoryRemote implements TodoRepository {
  TodoRepositoryRemote(this.api);
  final Api api;

  @override
  Future<List<Todo>> getTodos() async {
    await Future.delayed(const Duration(seconds: 2));
    final result = await api.getTodos();

    return result
        .map(
          (e) => Todo(
            userId: e.userId,
            id: e.id,
            title: e.title,
            completed: e.completed,
          ),
        )
        .toList();
  }

  @override
  Future<void> addTodo(Todo todo) async {
    // Simulate a network call
    await Future.delayed(const Duration(seconds: 2));
    return;
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    // Simulate a network call
    await Future.delayed(const Duration(seconds: 2));
    return;
  }

  @override
  Future<void> deleteTodo(String id) async {
    // Simulate a network call
    await Future.delayed(const Duration(seconds: 2));
    return;
  }

  @override
  Future<Todo?> getTodoById(String id) async {
    // Simulate a network call
    await Future.delayed(const Duration(seconds: 2));
    return null;
  }
}
