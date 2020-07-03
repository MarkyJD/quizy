import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizy/main.dart';
import 'package:quizy/homescreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final Color color1 = Color(0xff8A2387);
  final Color color2 = Color(0xffE94057);
  final Color color3 = Color(0xffF27121);

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2, color3],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text(
            'Quizy',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
              fontFamily: 'Monsterrat',
            ),
          ),
        ),
      ),
    );
  }
}
