import 'package:flutter/material.dart';
import 'package:wallpaper_app/home.dart';
import 'package:wallpaper_app/gallery.dart';
import 'package:wallpaper_app/ContactUs.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Wallpaper App"),
            accountEmail: Text("wallpaper@gmail.com"),
            decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.blueGrey,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  tileMode: TileMode.clamp),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? const Color(0xFF00897b)
                  : Colors.white,
              child: Text(
                "W",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Homepage())),
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Gallery'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Gallery())),
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
    );
  }
}
