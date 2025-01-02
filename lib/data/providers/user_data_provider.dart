import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_app/data/repositories/user/local_user_repository.dart';
import 'package:sample_app/domain/models/user.dart';

part 'user_data_provider.g.dart';

@Riverpod(keepAlive: false)
Future<User> userData(Ref ref) {
  final repo = ref.watch(localUserRepositoryProvider);
  return repo.getUserData();
}
