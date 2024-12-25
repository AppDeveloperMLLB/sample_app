import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_app/features/user/presentation/pages/login/components/login_form.dart';

class LoginPageBody extends ConsumerWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: LoginForm(),
    );
  }
}