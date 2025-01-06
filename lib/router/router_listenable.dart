import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_app/app_state/logged_in_provider.dart';
import 'package:sample_app/router/router.dart';

part 'router_listenable.g.dart';

@Riverpod(keepAlive: true)
class RouterListenable extends _$RouterListenable implements Listenable {
  VoidCallback? _routerListener;
  //late AsyncValue<bool> _isAuthenticated;
  late bool _loggedIn;
  @override
  void build() async {
    _loggedIn = ref.watch(loggedInProvider);

    // ref.listen((prev, next) {

    //   _routerListener?.call();
    // });
  }

  Future<String?> redirect(
    // ignore: avoid_build_context_in_providers
    BuildContext context,
    GoRouterState state,
  ) async {
    final shouldRedirectLoginPage =
        !_loggedIn && state.matchedLocation != const LoginRoute().location;
    if (shouldRedirectLoginPage) {
      return const LoginRoute().location;
    }

    return null;
    // if (_isAuthenticated.isLoading || _isAuthenticated.hasError) {
    //   return AppRoutePath.loginPage;
    // }
    // if (state.matchedLocation == AppRoutePath.todoList) {
    //   return _isAuthenticated.requireValue
    //       ? AppRoutePath.todoList
    //       : AppRoutePath.loginPage;
    // }
    // return null;
  }

  @override
  void addListener(VoidCallback listener) => _routerListener = listener;

  @override
  void removeListener(VoidCallback listener) => _routerListener = null;
}
