import 'package:flutter_study/notifiers/auth.dart';
import 'package:test/test.dart';

import '../create_test_container.dart';

void main() {
  test('Test init value', () {
    final container = createTestContainer();

    expect(
      container.read(authProvider),
      equals(false),
    );
  });

  test('Test login/logout functions', () {
    // Insert all state changes into this array
    final stateChanges = <bool>[];
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
