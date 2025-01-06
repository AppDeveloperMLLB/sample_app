import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_app/data/providers/home_page_data_provider.dart';

class HomePageBody extends ConsumerWidget {
  const HomePageBody({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(homePageDataProvider);
    if (data.isRefreshing) {
      return const CircularProgressIndicator();
    }

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
