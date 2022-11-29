import 'package:flutter/material.dart';

class PhotoListingView extends StatefulWidget {
  const PhotoListingView({Key? key}) : super(key: key);

  @override
  State<PhotoListingView> createState() => _PhotoListingViewState();
}

class _PhotoListingViewState extends State<PhotoListingView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 15,
          ),
          const Text('No photos yet. Upload it!'),
        ],
      ),
    );
  }
}
