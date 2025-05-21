import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/router/routes.dart';
import 'package:sample_app/ui/core/widgets/app_shell_route_page.dart';
import 'package:sample_app/ui/features/ai_chat/widgets/ai_chat_page.dart';
import 'package:sample_app/ui/features/home/widgets/home_page.dart';
import 'package:sample_app/ui/features/settings/widgets/settings_page.dart';
import 'package:sample_app/ui/features/user/widgets/login_page.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<MyShellRouteData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeRoute>(path: Routes.home),
    TypedGoRoute<SettingsRoute>(
      path: Routes.settings,
    ),
  ],
)
class MyShellRouteData extends ShellRouteData {
  const MyShellRouteData();

  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return AppShellRoutePage(child: navigator);
  }
}

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomePage();
}

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

@TypedGoRoute<AIChatRoute>(path: "/ai-chat")
class AIChatRoute extends GoRouteData {
  const AIChatRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const AIChatPage();
  }
}
