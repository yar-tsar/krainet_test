import 'package:flutter/material.dart';
import 'package:krainet_test/models/main_page/photo_listing/photo_listing_view.dart';

class PhotoListingRoute extends StatelessWidget {
  const PhotoListingRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              PhotoListingView(),
            ],
          ),
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add_photo_alternate_sharp),
      ),
    );
  }
}
