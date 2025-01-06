import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/ui/features/home/widgets/home_page.dart';
import 'package:sample_app/ui/features/settings/widgets/settings_page.dart';
import 'package:sample_app/ui/features/user/widgets/login_page.dart';

part 'router.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: <TypedGoRoute<GoRouteData>>[
    // TypedGoRoute<FamilyRoute>(
    //   path: 'family/:fid',
    // ),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomeRoutePage();
}

@TypedGoRoute<LoginRoute>(path: "/login")
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) =>
      const LoginPage();
}

@TypedGoRoute<SettingsRoute>(path: "/settings")
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const SettingsPage();
  }
}
