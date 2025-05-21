import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_app/app_state/logged_in_provider.dart';
import 'package:sample_app/router/router.dart';
import 'package:sample_app/ui/core/widgets/app_text_form_field.dart';
import 'package:sample_app/data/repositories/user/local_user_repository.dart';
import 'package:sample_app/ui/features/user/view_models/login_page_state.dart';

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
    // showLicensePage(context: context);
    // return;
    try {
      ref.read(loginPageStateNotifierProvider.notifier).setLoading(true);
      await ref.read(localUserRepositoryProvider).login(
            email: emailKey.currentState!.value!,
            password: passwordKey.currentState!.value!,
          );
      ref.read(loggedInProvider.notifier).setLoggedIn(true);
      if (mounted) {
        const HomeRoute().go(context);
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
