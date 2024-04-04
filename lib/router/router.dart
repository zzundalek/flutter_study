import 'package:flutter/material.dart';
import 'package:flutter_study/components/pages/home_page.dart';
import 'package:flutter_study/components/pages/list_page.dart';
import 'package:flutter_study/components/pages/login_page.dart';
import 'package:flutter_study/notifiers/auth.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

/// Router reacting on auth provider
/// Inspired by https://github.com/lucavenir/go_router_riverpod/blob/master/example/lib/router/router.dart
@riverpod
GoRouter router(RouterRef ref) {
  final auth = ref.watch(authProvider);

  final router = GoRouter(
    redirect: (BuildContext context, GoRouterState state) =>
        auth ? null : LoginPage.path,
    routes: [
      GoRoute(
        path: HomePage.path,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: ListPage.path,
        builder: (context, state) => const ListPage(),
      ),
      GoRoute(
        path: LoginPage.path,
        builder: (context, state) => const LoginPage(),
      ),
    ],
  );

  // Dispose the GoRouter object when this provider is disposed
  ref.onDispose(router.dispose);

  return router;
}
