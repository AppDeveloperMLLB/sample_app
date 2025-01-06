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
              title: '問い合わせ',
              onTap: () {},
            ),
            AppSettingsItem(
              title: 'FAQ',
              onTap: () {
                //showLicensePage(context: context);
              },
            ),
            AppSettingsItem(
              title: 'Terms Of Service',
              onTap: () {
                //showLicensePage(context: context);
              },
            ),
            AppSettingsItem(
              title: 'Privacy Policy',
              onTap: () {
                //showLicensePage(context: context);
              },
            ),
            AppSettingsItem(
              title: 'Licenses',
              onTap: () {
                showLicensePage(context: context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
