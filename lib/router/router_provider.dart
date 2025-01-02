import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_app/app_state/logged_in_provider.dart';
import 'package:sample_app/router/router.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  return GoRouter(
    routes: $appRoutes,
    redirect: (BuildContext context, GoRouterState state) {
      print('redirect: ${state.matchedLocation}');
      final loggedIn = ref.read(loggedInProvider);
      print('loggedIn: $loggedIn');
      final shouldRedirectLoginPage =
          !loggedIn && state.matchedLocation != const LoginRoute().location;
      if (shouldRedirectLoginPage) {
        return const LoginRoute().location;
      }

      return null;
    },
    // errorBuilder: (BuildContext context, GoRouterState state) {
    //   return ErrorRoute(error: state.error!).build(context, state);
    // },
  );
}
