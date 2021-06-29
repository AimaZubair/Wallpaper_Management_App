import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.red,
    title: Center(
      child: Text(
        'Wallpaper Management App',
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'FredokaOne',
        ),
      ),
    ),
  );
}
