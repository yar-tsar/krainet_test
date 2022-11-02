import 'package:flutter/material.dart';
import 'package:krainet_test/models/enter/enter_route.dart';
import 'package:krainet_test/theme/custom_theme.dart';

void main() {
  runApp(PixelsApp());
}

class PixelsApp extends StatelessWidget {
  const PixelsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: PixelsTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      title: 'Pixels App',
      home: const EnterRoute(),
    );
  }
}
