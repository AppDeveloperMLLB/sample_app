import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:sample_app/domain/models/todo.dart";

class HomePageBody extends ConsumerWidget {
  const HomePageBody({
    required this.todo,
    super.key,
  });
  final List<Todo> todo;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (todo.isNotEmpty) {
      return ListView.builder(
        itemCount: todo.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todo[index].title),
          );
        },
      );
    } else {
      return const Text("No todos found");
    }
  }
}
