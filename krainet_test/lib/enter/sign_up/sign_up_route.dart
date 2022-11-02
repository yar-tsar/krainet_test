import 'package:flutter/material.dart';
import 'package:krainet_test/enter/sign_up/sign_up_form.dart';

class SignUpRoute extends StatelessWidget {
  const SignUpRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 210, left: 40, right: 40),
          child: Center(
            child: Column(
              children: const <Widget>[
                SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
