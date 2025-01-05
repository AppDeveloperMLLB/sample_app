import 'package:flutter/material.dart';

class AppSettingsItem extends StatelessWidget {
  const AppSettingsItem({
    required this.title,
    required this.onTap,
    super.key,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Language'),
      tileColor: Colors.white,
      trailing: const Icon(Icons.arrow_forward_ios),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onTap: onTap,
    );
  }
}
