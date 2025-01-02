import 'package:flutter/material.dart';
import 'package:sample_app/ui/core/localizations/strings.g.dart';
import 'package:sample_app/ui/features/home/widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print(LocaleSettings.currentLocale);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.sample.title),
      ),
      body: const SafeArea(
        child: Center(
          child: HomePageBody(),
        ),
      ),
    );
  }
}
