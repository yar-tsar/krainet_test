import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:krainet_test/models/splash_page/progress_widget.dart';

class SplashRoute extends StatelessWidget {
  const SplashRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/logo.svg',
                semanticsLabel: 'App Logo',
                width: 250,
                height: 70,
              ),
              SizedBox(
                height: 250,
                child: progressWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
