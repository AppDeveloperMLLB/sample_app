import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_repository.g.dart';

@Riverpod()
NotificationRepository notificationRepository(Ref ref) {
  return NotificationRepository();
}

class NotificationRepository {
  Future<List<Notification>> getNotification({required String userId}) async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    return [
      Notification(
        id: '1',
        title: 'Notification 1',
        message: 'This is notification 1',
      ),
      Notification(
        id: '2',
        title: 'Notification 2',
        message: 'This is notification 2',
      ),
      Notification(
        id: '3',
        title: 'Notification 3',
        message: 'This is notification 3',
      ),
    ];
  }
}

class Notification {
  final String id;
  final String title;
  final String message;

  Notification({
    required this.id,
    required this.title,
    required this.message,
  });
}
