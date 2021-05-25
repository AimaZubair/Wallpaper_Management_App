import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF282A36),
        primaryColor: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text('Contact Us'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('images/profile.jpg'),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('Filza Mukhtar'.toUpperCase()),
              SizedBox(
                height: 15.0,
                width: 200.0,
                child: Divider(
                  color: Colors.pink,
                ),
              ),
              Text('FA17-BCS-021'.toUpperCase()),
              SizedBox(
                height: 10.0,
              ),
              Card(
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.pink,
                  ),
                  title: Text('030456785325'),
                ),
              ),
              Card(
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.pink,
                  ),
                  title: Text('FilzaMukhtar@gmail.com'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
