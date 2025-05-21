import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class AppShellRoutePage extends StatefulWidget {
  const AppShellRoutePage({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  State<AppShellRoutePage> createState() => _AppShellRoutePageState();
}

class _AppShellRoutePageState extends State<AppShellRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateIndex(GoRouter.of(context).state!.path!),
        onTap: (index) {
          // タブの選択で画面遷移
          context.go(_locationForIndex(index));
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      body: widget.child,
    );
  }

  int _calculateIndex(String location) {
    // 現在のルートに基づいてインデックスを計算
    if (location == '/settings') {
      return 1;
    }
    return 0;
  }

  String _locationForIndex(int index) {
    // インデックスに基づいてルートを決定
    switch (index) {
      case 0:
        return '/';
      case 1:
        return '/settings';
      default:
        return '/';
    }
  }
}
