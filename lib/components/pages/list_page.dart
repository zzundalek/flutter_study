import 'package:flutter/material.dart';
import 'package:flutter_study/components/pages/home_page.dart';
import 'package:go_router/go_router.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  static const path = '/list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Example list page'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => context.go(HomePage.path),
              child: const Text('Go to homepage'),
            ),
          ],
        ),
      ),
    );
  }
}
