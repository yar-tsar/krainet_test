import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:krainet_test/enter/enter_form.dart';

class EnterRoute extends StatelessWidget {
  const EnterRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 210),
        child: Center(
          child: Column(
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/logo.svg',
                semanticsLabel: 'App Logo',
                width: 250,
                height: 70,
              ),
              const SizedBox(
                height: 25,
              ),
              // const EnterForm()
            ],
          ),
        ),
      ),
    );
  }
}
