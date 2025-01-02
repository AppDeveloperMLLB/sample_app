import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logged_in_provider.g.dart';

@Riverpod(keepAlive: true)
class LoggedIn extends _$LoggedIn {
  @override
  bool build() {
    return false;
  }

  void setLoggedIn(bool value) {
    state = value;
  }
}
