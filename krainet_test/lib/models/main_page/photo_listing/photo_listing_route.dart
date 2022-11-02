import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.only(top: 110, left: 40, right: 40),
        child: Center(
          child: Column(
            children: const <Widget>[
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
