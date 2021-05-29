import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'home.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 40), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Homepage(),
      ));
    });
  }

  // added test yourself
  // and made the text to align at center
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage("images/2.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              child: ColorizeAnimatedTextKit(
                onTap: () {
                  print("Tap Event");
                },
                text: [
                  "Aima Zubair\n(FA17-BCS-009)",
                  "Faizan Ali\n(FA17-BCS-016)",
                  "Filza Mukhtar\n(FA17-BCS-021)",
                  "Hafsa Faryad\n(FA17-BCS-025)",
                  "Jawaria Bashir\n(FA17-BCS-031)",
                  "Maria Nadeem\n(FA17-BCS-039)",
                ],
                textStyle: TextStyle(
                  fontSize: 30.0,
                ),
                colors: [
                  Colors.red,
                  Colors.blueGrey,
                  Colors.yellow,
                  Colors.greenAccent,
                ],
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10.0,
              child: Divider(),
            ),
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 75,
              backgroundImage: AssetImage('images/load.gif'),
            ),
            Center(
              child: Container(
                width: 200,
                height: 200,
                child: FlareActor(
                  "assets/flareintro.flr",
                  animation: "Build and Fade Out",
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
