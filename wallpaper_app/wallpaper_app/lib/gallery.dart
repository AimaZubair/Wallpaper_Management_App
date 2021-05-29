import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(
            child: Text(
              'Gallery',
              style: TextStyle(
                fontSize: 30.0,
            
              ),
            ),
          ),
        ),
        body: Center(
          child: Text('Gallery'),
        ));
  }
}
