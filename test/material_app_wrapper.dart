import 'package:flutter/material.dart';

class MaterialAppWrapper extends StatelessWidget {
  const MaterialAppWrapper({
    required this.body,
    super.key,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: body,
      ),
    );
  }
}
