import 'package:flutter/material.dart';
import 'package:wallpaper_management_app/components/AppBar.dart';
import 'package:wallpaper_management_app/components/Drawer.dart';
import 'package:wallpaper_management_app/components/admin_view.dart';
import 'package:wallpaper_management_app/add_image.dart';

class Admin extends StatefulWidget {
  Admin({Key key}) : super(key: key);
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(context),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Admin \n Site',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 200, left: 50, bottom: 30),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 50,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Wallpaper()));
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Text(
                    'Add Image',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 40),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.delete_rounded,
                      color: Colors.white,
                      size: 50,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Admin_view(
                                title: 'Wallpaper Management App',
                              )));
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Text(
                    'Delete Image',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
