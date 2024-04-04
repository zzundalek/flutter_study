import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  bool build() => false;

  void login() => state = true;
  void logout() => state = false;
}
