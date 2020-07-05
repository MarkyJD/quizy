import 'package:flutter/material.dart';
import 'package:quizy/homescreen.dart';
import 'package:quizy/question.dart';

class ScoreScreen extends StatelessWidget {
  final int score;
  final List<Question> questions;
  final List<int> wrongList;

  ScoreScreen(this.score, this.wrongList, this.questions);

  final Color color1 = Color(0xff8A2387);
  final Color color2 = Color(0xffE94057);
  final Color color3 = Color(0xffF27121);
  final Color wrongColor = Color(0x66eb4034);
  final Color correctColor = Color(0x6680f28c);

  @override
  Widget build(BuildContext context) {
    double percentage = (score.toDouble() / questions.length.toDouble()) * 100;
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
                          'Your Score: ${score.toString()}/${questions.length.toString()}\n%${percentage.toString()}',
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
                        Container(
                          margin: EdgeInsets.only(
                            left: 200,
                          ),
                          child: Text(
                            '\nCorrect Answers:',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Merriweather',
                              fontSize: 16.0,
                              color: Colors.blueGrey[300],
                              shadows: [
                                Shadow(
                                  color: Colors.blueGrey[400],
                                  blurRadius: 2.0,
                                ),
                              ],
                            ),
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
            flex: 5,
            child: Container(
              child: ListView.builder(
                itemExtent: 80,
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Card(
                    color:
                        wrongList.contains(index) ? wrongColor : correctColor,
                    child: ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      trailing: Text(
                        '${questions.elementAt(index).correctAnswer}',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Merriweather',
                          fontSize: 12.0,
                        ),
                      ),
                      onTap: () {},
                      subtitle: Text(
                        questions.elementAt(index).question,
                        style: TextStyle(
                          fontFamily: 'Merriweather',
                        ),
                      ),
                      title: Text(
                        (index + 1).toString(),
                        style: TextStyle(
                          fontFamily: 'Playfair',
                          fontWeight: FontWeight.bold,
                          color: Colors.orange[100],
                        ),
                      ),
                    ),
                  );
                },
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
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ),
                    );
                  },
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
    );
  }
}
