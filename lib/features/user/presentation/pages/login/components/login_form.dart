import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_app/core/presentation/components/app_text_form_field.dart';
import 'package:sample_app/features/home/presentation/pages/home_page/home_page.dart';
import 'package:sample_app/features/user/data/repositories/local_user_repository.dart';
import 'package:sample_app/features/user/presentation/pages/login/login_page_state.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> emailKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> passwordKey =
      GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          AppTextFormField(
            fieldKey: emailKey,
            label: "Email",
            hint: "Enter your email",
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          AppTextFormField(
            fieldKey: passwordKey,
            label: "Password",
            hint: "Enter your password",
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                login();
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  Future<void> login() async {
    try {
      ref.read(loginPageStateNotifierProvider.notifier).setLoading(true);
      await ref.read(localUserRepositoryProvider).login(
            email: emailKey.currentState!.value!,
            password: passwordKey.currentState!.value!,
          );
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
    } catch (e) {
      // openDialog(
      //   context: context,
      //   title: "エラー",
      //   subTitle: e.toString(),
      // );
      ref
          .read(loginPageStateNotifierProvider.notifier)
          .setError(e as Exception);
    } finally {
      ref.read(loginPageStateNotifierProvider.notifier).setLoading(false);
    }
  }
}
