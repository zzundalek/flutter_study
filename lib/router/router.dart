import 'package:flutter/material.dart';
import 'package:flutter_study/components/pages/home_page.dart';
import 'package:flutter_study/components/pages/login_page.dart';
// import 'package:flutter_study/components/pages/recipe_detail_page.dart';
import 'package:flutter_study/components/pages/recipe_detail_hooks_page.dart';
import 'package:flutter_study/components/pages/recipes_page.dart';
import 'package:flutter_study/components/pages/test_page.dart';
import 'package:flutter_study/model/recipe.dart';
import 'package:flutter_study/notifiers/auth.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

/// Defines typesafe routes using go_router and go_router_builder
/// See [GoRouter documentation](https://pub.dev/documentation/go_router/latest/topics/Type-safe%20routes-topic.html)
/// See [GoRouter builder documentation](https://pub.dev/documentation/go_router_builder/latest/)

/// Home Route
@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<RecipesRoute>(
      path: 'recipes',
      routes: [
        TypedGoRoute<RecipeDetailRoute>(
          path: ':id',
        ),
      ],
    ),
    TypedGoRoute<TestRoute>(
      path: 'test',
    ),
  ],
)
@immutable
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

@immutable
class RecipesRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RecipesPage();
  }
}

@immutable
class RecipeDetailRoute extends GoRouteData {
  const RecipeDetailRoute({required this.id});

  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return RecipeDetail(recipe: Recipe.samples[id]);
  }
}

@immutable
class TestRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TestPage();
  }
}

/// Login Route
const loginPath = '/login';

@TypedGoRoute<LoginRoute>(
  path: loginPath,
)
@immutable
class LoginRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

/// Router reacting on auth provider
/// Inspired by https://github.com/lucavenir/go_router_riverpod/blob/master/example/lib/router/router.dart
@riverpod
GoRouter router(RouterRef ref) {
  final auth = ref.watch(authProvider);

  final router = GoRouter(
    redirect: (BuildContext context, GoRouterState state) =>
        auth ? null : loginPath,
    routes: $appRoutes,
  );

  // Dispose the GoRouter object when this provider is disposed
  ref.onDispose(router.dispose);

  return router;
}
