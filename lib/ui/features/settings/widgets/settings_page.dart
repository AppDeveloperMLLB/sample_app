import 'package:flutter/material.dart';
import 'package:sample_app/ui/core/widgets/app_settings_item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            AppSettingsItem(
              title: 'Language',
              onTap: () {
                //Navigator.pushNamed(context, '/settings/language');
              },
            ),
          ],
        ),
      ),
    );
  }
}
