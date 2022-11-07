import 'package:flutter/material.dart';
import 'package:krainet_test/application/logout_function.dart';
import 'package:krainet_test/models/enter/enter_route.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 15,
          ),
          const Text('Name:'),
          const SizedBox(
            height: 10,
          ),
          const Text('Birthday:'),
          const SizedBox(
            height: 10,
          ),
          const Text('Your e-mail:'),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white,
            ),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Are you sure?'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel')),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EnterRoute(),
                            ));
                        logOut();
                      },
                      child: const Text('Log out')),
                ],
              ),
            ),
            child: const Text('Log out'),
          ),
        ],
      ),
    );
  }
}
