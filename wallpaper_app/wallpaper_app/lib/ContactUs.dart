import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
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
          backgroundColor: Colors.red,
          title: Center(
            child: Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'FredokaOne',
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 60.0),
                  ),
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 60.0,
                        backgroundImage: AssetImage('images/AA.png'),
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Aima Zubair',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'FA17-BCS-009',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 60.0),
                  ),
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 60.0,
                        backgroundImage: AssetImage('images/faizan.jpeg'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Faizan Ali',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'FA17-BCS-016',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 60.0),
                  ),
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 60.0,
                        backgroundImage: AssetImage('assets/images/Filza.jpeg'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Filza Mukhtar',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'FA17-BCS-021',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, bottom: 20.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 60.0),
                  ),
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 60.0,
                        backgroundImage: AssetImage('assets/images/Hafsa.jpeg'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Hafsa Faryad',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'FA17-BCS-025',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 60.0),
                  ),
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 60.0,
                        backgroundImage:
                            AssetImage('assets/images/Jaweria.jpeg'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Jaweria Bashir',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'FA17-BCS-031',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 60.0),
                  ),
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 60.0,
                        backgroundImage: AssetImage('assets/images/Maria.jpeg'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Maria Nadeem',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'FA17-BCS-039',
                        style: TextStyle(
                          fontSize: 20.0,
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
        ),
      ),
    );
  }
}
