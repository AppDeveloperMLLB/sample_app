import 'package:flutter/material.dart';
import 'package:sample_app/features/home/presentation/pages/home_page/components/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
      body: const SafeArea(
        child: Center(
          child: HomePageBody(),
        ),
      ),
    );
  }
}
