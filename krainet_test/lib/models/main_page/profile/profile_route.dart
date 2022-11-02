import 'package:flutter/material.dart';
import 'package:krainet_test/models/main_page/profile/profile_view.dart';

class ProfileRoute extends StatelessWidget {
  const ProfileRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 110, left: 40, right: 40),
        child: Center(
          child: Column(
            children: const <Widget>[
              ProfileView(),
            ],
          ),
        ),
      ),
    );
  }
}
