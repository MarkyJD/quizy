import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final Color color1 = Color(0xff8A2387);
  final Color color2 = Color(0xffE94057);
  final Color color3 = Color(0xffF27121);

  Widget answerButton() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {},
        elevation: 10.0,
        minWidth: 200,
        height: 45,
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
        color: Colors.white24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
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
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Center(
                child: Text(
                  'How many roads must a man walk down?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'Merriweather',
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  answerButton(),
                  answerButton(),
                  answerButton(),
                  answerButton(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[900],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[800],
                    blurRadius: 4.0,
                  )
                ],
              ),
              child: Center(
                child: MaterialButton(
                  onPressed: () {},
                  elevation: 10.0,
                  minWidth: 150,
                  height: 40,
                  child: Text(
                    'End',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.3,
                      fontFamily: 'Playfair',
                    ),
                  ),
                  color: color2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
