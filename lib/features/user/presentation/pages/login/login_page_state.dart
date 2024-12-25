import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_page_state.g.dart';
part 'login_page_state.freezed.dart';

@riverpod
class LoginPageStateNotifier extends _$LoginPageStateNotifier {
  @override
  LoginPageState build() {
    return const LoginPageState();
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setError(Exception error) {
    state = state.copyWith(error: error);
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

@freezed
class LoginPageState with _$LoginPageState {
  const LoginPageState._();
  const factory LoginPageState([
    @Default(false) bool isLoading,
    Exception? error,
  ]) = _LoginPageState;

  bool hasError() {
    return error != null;
  }
}

// @freezed
// class Person with _$Person {
//   const factory Person(String name, {int? age}) = _Person;

//   void method() {
//     print('hello world');
//   }
// }
