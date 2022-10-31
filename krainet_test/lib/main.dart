import 'package:flutter/material.dart';
import 'package:krainet_test/enter/enter_route.dart';

void main() {
  runApp(PixelsApp());
}

class PixelsApp extends StatelessWidget {
  const PixelsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pixels App',
      home: const EnterRoute(),
    );
  }
}
