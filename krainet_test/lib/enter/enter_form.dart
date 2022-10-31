import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EnterForm extends StatefulWidget {
  const EnterForm({Key? key}) : super(key: key);

  @override
  State<EnterForm> createState() => _EnterFormState();
}

class _EnterFormState extends State<EnterForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
