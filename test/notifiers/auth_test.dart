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

  test('Test login/logout function', () {
    final container = createTestContainer();
    expect(
      container.read(authProvider),
      equals(false),
    );

    container.read(authProvider.notifier).login();
    expect(
      container.read(authProvider),
      equals(true),
    );

    container.read(authProvider.notifier).logout();
    expect(
      container.read(authProvider),
      equals(false),
    );
  });
}
