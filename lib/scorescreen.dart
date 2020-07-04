import 'package:flutter/material.dart';
import 'package:quizy/question.dart';

class ScoreScreen extends StatelessWidget {
  final int score;
  final int numberOfQuestions;
  final List<List<String>> wrongList;

  Widget myListTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListTile(
        title: Text(
          'hello',
        ),
        trailing: Text(
          'Its me',
        ),
      ),
    );
  }

  ScoreScreen(this.score, this.wrongList, this.numberOfQuestions);

  final Color color1 = Color(0xff8A2387);
  final Color color2 = Color(0xffE94057);
  final Color color3 = Color(0xffF27121);

  @override
  Widget build(BuildContext context) {
    double percentage = (score.toDouble() / numberOfQuestions.toDouble()) * 100;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2, color3],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
              flex: 2,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            'Your Score: ${score.toString()}/${numberOfQuestions.toString()}\n%${percentage.toString()}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Merriweather',
                              fontSize: 20.0,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.blueGrey[900],
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '\nWrong Answers:',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Merriweather',
                              fontSize: 20.0,
                              color: Colors.blueGrey[100],
                              shadows: [
                                Shadow(
                                  color: Colors.blueGrey[900],
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: ListView(
                  children: <Widget>[
                    myListTile(),
                    myListTile(),
                    myListTile(),
                    myListTile(),
                    myListTile(),
                    myListTile(),
                    myListTile(),
                    myListTile(),
                    myListTile(),
                    myListTile(),
                    myListTile(),
                    myListTile(),
                    myListTile(),
                    myListTile(),
                    myListTile(),
                    myListTile(),
                    myListTile(),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
