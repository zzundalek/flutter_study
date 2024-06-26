import 'package:flutter_study/notifiers/auth.dart';
import 'package:test/test.dart';

import '../create_test_container.dart';

void main() {
  test('Test init value', () {
    // Avoid automatic disposal. See https://riverpod.dev/docs/essentials/testing#mocking-providers for more info
    final auth = createTestContainer().listen<bool>(authProvider, (_, __) {});

    expect(
      auth.read(),
      equals(false),
    );
  });

  test('Test login/logout functions', () {
    final stateChanges = <bool>[];

    // Insert all state changes into this stateChanges array
    final container = createTestContainer()
      ..listen<bool>(
        authProvider,
        (_, next) {
          stateChanges.add(next);
        },
      );

    container.read(authProvider.notifier).login();
    container.read(authProvider.notifier).logout();
    container.read(authProvider.notifier).login();

    expect(
      stateChanges,
      equals([true, false, true]),
    );
  });
}
