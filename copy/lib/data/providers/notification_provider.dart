import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:sample_app/data/repositories/notifications/notification_repository.dart";

part "notification_provider.g.dart";

@Riverpod(keepAlive: false)
Future<List<Notification>> notification(Ref ref) async {
  //final user = await ref.watch(userDataProvider.future);
  final repo = ref.watch(notificationRepositoryProvider);
  return repo.getNotification(userId: "user.id");
}
