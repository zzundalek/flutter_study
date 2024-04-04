import 'package:flutter/material.dart';
import 'package:flutter_study/components/pages/list_page.dart';
import 'package:flutter_study/notifiers/auth.dart';
import 'package:flutter_study/notifiers/counter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const path = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterNotifier = ref.read(counterProvider.notifier);
    final authNotifier = ref.read(authProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer(
              builder: (context, ref, child) {
                return Text(
                  ref.watch(counterProvider).count.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            TextButton(
              onPressed: () => context.go(ListPage.path),
              child: const Text('Go to list page'),
            ),
            TextButton(
              onPressed: authNotifier.logout,
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterNotifier.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
