import 'package:flutter_study/components/count.dart';
import 'package:flutter_study/notifiers/counter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../material_app_wrapper.dart';

/// Simple widget testing
/// https://docs.flutter.dev/cookbook/testing/widget/introduction
/// https://riverpod.dev/docs/essentials/testing#widget-tests

void main() {
  testWidgets('Test initial value', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialAppWrapper(
          body: Count(),
        ),
      ),
    );

    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('Test increment', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialAppWrapper(
          body: Count(),
        ),
      ),
    );

    final element = tester.element(find.byType(Count));

    // increment
    ProviderScope.containerOf(element)
        .read(counterProvider.notifier)
        .increment();

    // wait for rerender to complete
    await tester.pumpAndSettle();

    expect(find.text('1'), findsOne);
  });
}
