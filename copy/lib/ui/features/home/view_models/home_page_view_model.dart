import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:sample_app/data/repositories/repositories.dart";
import "package:sample_app/domain/models/todo.dart";

part "home_page_view_model.freezed.dart";
part "home_page_view_model.g.dart";

// @freezed
// class HomePageState with _$HomePageState {
//   const factory HomePageState.initial() = _Initial;
//   const factory HomePageState.loading() = _Loading;
//   const factory HomePageState.loaded(List<Todo> todos) = _Loaded;
//   const factory HomePageState.error(Exception e) = _Error;
//   const HomePageState._();
//   List<Todo> get todos => when(
//         initial: () => [],
//         loading: () => [],
//         loaded: (todos) => todos,
//         error: (_) => [],
//       );
//   Exception? get error => when(
//         initial: () => null,
//         loading: () => null,
//         loaded: (_) => null,
//         error: (e) => e,
//       );
// }

// @riverpod
// class HomePageViewModel extends _$HomePageViewModel {
//   @override
//   HomePageState build() {
//     loadTodos();
//     return const HomePageState.initial();
//   }

//   Future<void> loadTodos() async {
//     state = const HomePageState.loading();
//     try {
//       final repo = ref.read(todoRepositoryProvider);
//       final todos = await repo.getTodos();
//       state = HomePageState.loaded(todos);
//     } on Exception catch (e, _) {
//       state = HomePageState.error(
//         e,
//       );
//     }
//   }
// }

@freezed
abstract class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default([]) List<Todo> todos,
    @Default(true) bool isLoading,
    @Default(null) Exception? error,
  }) = _HomePageState;
  const HomePageState._();
}

@riverpod
class HomePageViewModel extends _$HomePageViewModel {
  @override
  HomePageState build() {
    loadTodos();
    return const HomePageState();
  }

  Future<void> loadTodos() async {
    state = const HomePageState(isLoading: true);
    try {
      final repo = ref.read(todoRepositoryProvider);
      final todos = await repo.getTodos();
      state = HomePageState(
        todos: todos,
        isLoading: false,
      );
    } on Exception catch (e, _) {
      state = HomePageState(
        error: e,
        isLoading: false,
      );
    }
  }
}
