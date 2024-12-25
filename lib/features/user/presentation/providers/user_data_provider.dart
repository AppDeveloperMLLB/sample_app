import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_app/features/user/data/repositories/local_user_repository.dart';
import 'package:sample_app/features/user/domain/entities/user.dart';

part 'user_data_provider.g.dart';

@Riverpod(keepAlive: false)
Future<User> userData(Ref ref) {
  final repo = ref.watch(localUserRepositoryProvider);
  return repo.getUserData();
}
