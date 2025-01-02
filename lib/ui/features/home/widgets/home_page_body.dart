import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_app/data/providers/home_page_data_provider.dart';

class HomePageBody extends ConsumerWidget {
  const HomePageBody({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen(
    //   notificationProvider,
    //   (prev, next) async {
    //     if (prev == next) {
    //       return;
    //     }

    //     final showError = prev == null && next.hasError ||
    //         !prev!.hasError && next.hasError ||
    //         prev.isRefreshing && next.hasError;
    //     if (showError) {
    //       switch (next.error) {
    //         case UnexpectedError(:final message):
    //           await openDialog(
    //             context: context,
    //             title: "エラー",
    //             subTitle: message,
    //           );
    //           break;
    //         case NetworkError():
    //           RetryDialog.show(context, () async {
    //             // TODO: userDataProviderでエラーが出た場合は二つとも再取得し、
    //             // userDataProviderが成功した場合は、notificationProviderだけ再取得させたい
    //             try {
    //               await ref.watch(userDataProvider.future);
    //             } catch (e) {
    //               ref.invalidate(userDataProvider);
    //             }

    //             ref.invalidate(notificationProvider);
    //           });
    //           break;
    //         default:
    //           break;
    //       }

    //       return;
    //     }
    //   },
    // );
    //final notification = ref.watch(notificationProvider);
    final data = ref.watch(homePageDataProvider);
    if (data.isRefreshing) {
      return const CircularProgressIndicator();
    }
    // エラーの時にref.invalidateを実行しても、エラー表示のままになるので
    // isRefreshingを参照しローディング表示にする
    // https://github.com/rrousselGit/riverpod/issues/1568#issuecomment-1218041038
    // if (notification.isRefreshing) {
    //   return const CircularProgressIndicator();
    // }

    switch (data) {
      case AsyncData(:final value):
        return ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(value), //value[index].title),
              subtitle: Text(value), //value[index].message),
            );
          },
        );
      case AsyncError(:final error):
        return Text('Error: $error');
      case AsyncLoading():
        return const CircularProgressIndicator();
      default:
        return const CircularProgressIndicator();
    }
  }
}
