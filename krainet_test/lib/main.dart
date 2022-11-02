import 'package:flutter/material.dart';
import 'package:krainet_test/models/enter/enter_route.dart';

void main() {
  runApp(PixelsApp());
}

class PixelsApp extends StatelessWidget {
  const PixelsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pixels App',
      home: EnterRoute(),
    );
  }
}
