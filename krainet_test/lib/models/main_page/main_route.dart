import 'package:flutter/material.dart';

import 'photo_listing/photo_listing_route.dart';
import 'profile/profile_route.dart';

class MainRoute extends StatefulWidget {
  const MainRoute({Key? key}) : super(key: key);

  @override
  MainRouteState createState() {
    return MainRouteState();
  }
}

class MainRouteState extends State<MainRoute> {
  int _selectedIndex = 0;

  void onTapHandler(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const [
        PhotoListingRoute(),
        ProfileRoute(),
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        backgroundColor: const Color(0xFF3CCB75),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.photo_album),
            label: 'Photos',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.verified_user),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          onTapHandler(index);
        },
      ),
    );
  }
}
