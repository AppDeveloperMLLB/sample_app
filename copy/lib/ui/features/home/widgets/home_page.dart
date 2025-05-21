import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:sample_app/ui/core/localizations/strings.g.dart";
import "package:sample_app/ui/features/home/view_models/home_page_view_model.dart";
import "package:sample_app/ui/features/home/widgets/home_page_body.dart";

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(homePageViewModelProvider, (previous, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error.toString())),
        );
      }
    });

    final vm = ref.watch(homePageViewModelProvider);
    if (vm.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (vm.error != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(t.sample.title),
        ),
        body: Center(
          child: Text(vm.error.toString()),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(t.sample.title),
      ),
      body: SafeArea(
        child: HomePageBody(
          todo: vm.todos,
        ),
      ),
    );
  }
}
