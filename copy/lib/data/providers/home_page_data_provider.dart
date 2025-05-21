import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:sample_app/data/providers/notification_provider.dart";
import "package:sample_app/data/providers/user_data_provider.dart";

part "home_page_data_provider.g.dart";

@Riverpod()
Future<String> homePageData(Ref ref) async {
  try {
    final (result1, result2) = await (
      ref.watch(notificationProvider.future),
      ref.watch(userDataProvider.future),
    ).wait;
  } on ParallelWaitError catch (e) {
    print(e.errors.$1);
    print(e.errors.$2);
    print(e.values.$1);
    print(e.values.$2);
  }

  return "Hello world";
}
