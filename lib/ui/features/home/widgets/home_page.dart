import 'package:flutter/material.dart';
import 'package:sample_app/ui/core/localizations/strings.g.dart';
import 'package:sample_app/ui/features/ai_chat/widgets/ai_chat_page.dart';
import 'package:sample_app/ui/features/home/widgets/home_page_body.dart';
import 'package:sample_app/ui/features/settings/widgets/settings_page.dart';

class HomeRoutePage extends StatefulWidget {
  const HomeRoutePage({super.key});

  @override
  State<HomeRoutePage> createState() => _HomeRoutePageState();
}

class _HomeRoutePageState extends State<HomeRoutePage> {
  int _selectedIndex = 0;
  static const _screens = [
    HomePage(),
    SettingsPage(),
    AIChatPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '設定',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chat',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.sample.title),
      ),
      body: const SafeArea(
        child: HomePageBody(),
      ),
    );
  }
}
