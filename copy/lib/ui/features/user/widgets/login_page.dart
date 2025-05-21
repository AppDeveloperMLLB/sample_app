import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_app/ui/core/widgets/app_error_dialog.dart';
import 'package:sample_app/ui/features/user/widgets/login_page_body.dart';
import 'package:sample_app/ui/features/user/view_models/login_page_state.dart';

/// LoginPageでは、画面全体でローディングとエラーダイアログを表示する方針
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ローディング状態を取得
    final isLoading = ref.watch(
      loginPageStateNotifierProvider.select(
        (value) => value.isLoading,
      ),
    );

    ref.listen(
      loginPageStateNotifierProvider.select(
        (value) => value.error,
      ),
      (prev, next) async {
        if (prev == next) {
          return;
        }

        if (next == null) {
          return;
        }

        // エラーならダイアログを表示
        await openDialog(
          context: context,
          title: "エラー",
          subTitle: next.toString(),
        );
        // エラーをクリアしておかないと、再度エラーが発生した際に状態が変わらないので、ダイアログが表示されない
        ref.read(loginPageStateNotifierProvider.notifier).clearError();
      },
    );

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Login Page'),
          ),
          body: const SafeArea(
            child: LoginPageBody(),
          ),
        ),
        if (isLoading)
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white.withOpacity(0.75),
            child: const Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }
}
