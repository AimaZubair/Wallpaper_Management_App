import 'package:flutter/material.dart';
import 'package:wallpaper_management_app/home.dart';
import 'package:wallpaper_management_app/gallery.dart';
import 'package:wallpaper_management_app/ContactUs.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: new LinearGradient(colors: [
                  Colors.red,
                  Colors.redAccent,
                ], begin: Alignment.topLeft, tileMode: TileMode.clamp),
              ),
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 70,
                      height: 70,
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundImage: AssetImage('assets/icon.png'),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Wallpaper App',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'wallpaper@gmail.com',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homepage())),
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Gallery'),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Gallery())),
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_page),
              title: Text('Contact Us'),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactUs())),
              },
            ),
          ],
        ),
      ),
    );
  }
}
