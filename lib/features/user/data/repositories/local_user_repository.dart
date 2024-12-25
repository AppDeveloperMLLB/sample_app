import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_app/features/user/domain/entities/user.dart';

part 'local_user_repository.g.dart';

bool flg = true;
@riverpod
LocalUserRepository localUserRepository(Ref ref) {
  return LocalUserRepository();
}

class LocalUserRepository {
  Future<User> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    return User(
      id: '1',
      name: 'John Doe',
      email: '',
      password: '',
    );
  }

  Future<User> getUserData() async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    // if (flg) {
    //   flg = false;
    //   throw Exception('Error');
    // }

    return User(
      id: '1',
      name: 'John Doe',
      email: '',
      password: '',
    );
  }

  Future<void> logout() async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    return;
  }
}
