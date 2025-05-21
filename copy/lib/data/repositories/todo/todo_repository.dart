import "package:sample_app/domain/models/todo.dart";

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<void> addTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodo(String id);
  Future<Todo?> getTodoById(String id);
}
