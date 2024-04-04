import 'package:flutter/material.dart';
import 'package:flutter_study/components/pages/home_page.dart';
import 'package:flutter_study/components/pages/list_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      path: HomePage.path,
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: ListPage.path,
      builder: (context, state) => ListPage(),
    ),
  ],
);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      routerConfig: _router,
    );
  }
}
