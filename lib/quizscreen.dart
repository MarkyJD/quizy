import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizy/question.dart';
import 'package:quizy/questionbank.dart';
import 'package:quizy/scorescreen.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final Color color1 = Color(0xff8A2387);
  final Color color2 = Color(0xffE94057);
  final Color color3 = Color(0xffF27121);
  final Color wrongColor = Color(0x66eb4034);
  final Color correctColor = Color(0x6680f28c);
  final Color defalutColor = Colors.white24;
  int button0 = 0, button1 = 0, button2 = 0, button3 = 0;
  int score = 0;
  bool quizOver = false;

  QuestionBank questionBank = new QuestionBank();
  List<Question> questions;
  List<int> wrongList = [];
  int questionIndex = 0;

  void questionAnswered(int answerIndex) {
    bool correct;
    String currentAnswer =
        questions.elementAt(questionIndex).answers[answerIndex];

    if (!quizOver) {
      setState(() {
        if (questions.elementAt(questionIndex).isAnswerCorrect(currentAnswer)) {
          correct = true;
          score++;
        } else {
          wrongList.add(questionIndex);
          correct = false;
        }
        // Set button's state. This will control what color gets rendered.
        switch (answerIndex) {
          case 0:
            button0 = correct ? 1 : -1;
            break;
          case 1:
            button1 = correct ? 1 : -1;
            break;
          case 2:
            button2 = correct ? 1 : -1;
            break;
          case 3:
            button3 = correct ? 1 : -1;
            break;
        }
      });
    }

    Timer(Duration(milliseconds: 300), () {
      setState(() {
        if (questionIndex < questions.length - 1) {
          questionIndex++;
        } else {
          quizOver = true;
        }
        button0 = 0;
        button1 = 0;
        button2 = 0;
        button3 = 0;
      });
    });
  }

  Color getColor(int number) {
    if (number == -1) {
      return wrongColor;
    } else if (number == 1) {
      return correctColor;
    } else {
      return Colors.white12;
    }
  }

  Widget answerButton(int answerIndex, int buttonNumber) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {
          questionAnswered(answerIndex);
        },
        elevation: 10.0,
        minWidth: 200,
        height: 45,
        child: Text(
          questions.elementAt(questionIndex).answers[answerIndex],
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.3,
            fontFamily: 'Playfair',
          ),
        ),
        color: getColor(buttonNumber),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    questions = questionBank.questionsList;
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
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Topic: Android Programming Language',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Playfair',
                          color: Colors.blueGrey[400],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        '${questionIndex + 1} / ${questions.length}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Playfair',
                          color: Colors.blueGrey[100],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  questions.elementAt(questionIndex).question,
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
                  answerButton(0, button0),
                  answerButton(1, button1),
                  answerButton(2, button2),
                  answerButton(3, button3),
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
                  onPressed: () {
                    // If quiz ends prematurely, mark the rest wrong
                    if (!quizOver) {
                      for (int i = questionIndex; i < questions.length; i++) {
                        wrongList.add(i);
                      }
                    }
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => ScoreScreen(
                          score,
                          wrongList,
                          questions,
                        ),
                      ),
                    );
                  },
                  elevation: 10.0,
                  minWidth: 150,
                  height: 40,
                  child: Text(
                    'End Quiz',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.3,
                      fontFamily: 'Playfair',
                    ),
                  ),
                  color: quizOver ? correctColor : wrongColor,
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
