import 'package:flutter/material.dart';

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
            onPressed: null,
            child: const Text('Log out'),
          ),
        ],
      ),
    );
  }
}
