import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ContactUs.dart';
import 'gallery.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> images = [
    "images/download.png",
    "images/download1.png",
  ];

  List<String> des = [
    "Admin",
    "User",
  ];

  Widget customcard(String langname, String image, String des) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: InkWell(
        onTap: () {
          if (langname == "Admin") {
            //  Navigator.of(context).pushReplacement(MaterialPageRoute(
            // in changelog 1 we will pass the langname name to ther other widget class
            // this name will be used to open a particular JSON file
            // for a particular language
            //    builder: (context) => simple()));
          } else if (langname == "User") {
            //   Navigator.of(context).pushReplacement(MaterialPageRoute(
            // in changelog 1 we will pass the langname name to ther other widget class
            // this name will be used to open a particular JSON file
            // for a particular language
            //        builder: (context) => simple()));
          }
        },
        child: Material(
          color: Colors.black,
          elevation: 3.0,
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(50.0),
                  child: Container(
                    // changing from 200 to 150 as to look better
                    height: 100.0,
                    width: 100.0,
                    child: ClipOval(
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          image,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langname,
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    des,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: "Alike"),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Center(
          child: Text(
            'Wallpaper Management App',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'FredokaOne',
            ),
          ),
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 120.0,
            ),
            customcard("Admin", images[0], des[0]),
            customcard("User", images[1], des[1]),
          ],
        ),
      ),
    );
  }
}

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
