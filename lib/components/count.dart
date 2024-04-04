import 'package:flutter/material.dart';
import 'package:flutter_study/notifiers/counter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Count extends ConsumerWidget {
  const Count({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Text(
          'You have pushed the button this many times:',
        ),
        Text(
          ref.watch(counterProvider).count.toString(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
