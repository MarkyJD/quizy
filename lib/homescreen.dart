import 'dart:async';
import 'dart:io' show Platform, exit;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizy/quizscreen.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Color color1 = Color(0xff8A2387);
  final Color color2 = Color(0xffE94057);
  final Color color3 = Color(0xffF27121);
  bool isPressed = false;

  void startQuiz() {
    setState(() {
      isPressed = true;
    });
    Timer(Duration(milliseconds: 1500), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Quiz(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: Text(
          'Quizy',
          style: TextStyle(
            fontFamily: 'Monsterrat',
            color: color3,
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: EdgeInsets.all(20.0),
                height: 200,
                // color: Colors.indigo,
                child: Center(
                  child: Text(
                    'Welcome to\nQuizy!',
                    style: TextStyle(
                      color: color3,
                      shadows: [Shadow(color: Colors.white, blurRadius: 2.0)],
                      letterSpacing: 1.5,
                      fontSize: 40,
                      fontFamily: 'Merriweather',
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 20.0,
              ),
              child: MaterialButton(
                onPressed: startQuiz,
                elevation: 10.0,
                minWidth: 200,
                height: 50,
                child: Text(
                  'Start Quiz',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.3,
                    fontFamily: 'Playfair',
                  ),
                ),
                color: isPressed ? color2 : color3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                } else {
                  exit(0);
                }
              },
              elevation: 10.0,
              minWidth: 200,
              height: 50,
              child: Text(
                'Exit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.3,
                  fontFamily: 'Playfair',
                ),
              ),
              color: color3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
