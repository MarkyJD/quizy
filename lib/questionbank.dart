import 'package:quizy/question.dart';

class QuestionBank {
  List<Question> _questionsList;
  final List<List<String>> _questionsAndAnswers = [
    [
      'What file type is typically used to create layouts?',
      '.pdf',
      '.xml',
      '.txt',
      '.png',
      '.xml'
    ],
    [
      'What method is typically called when an app first starts up?',
      'onClick()',
      'onStart()',
      'nextInt()',
      'onCreate()',
      'onCreate()'
    ],
    [
      'What folder are images typically stored in?',
      'values/',
      'manifests/',
      'layout/',
      'drawable/',
      'drawable/'
    ],
    [
      'Which data type is NOT a valid data type?',
      'pointer',
      'int',
      'boolean',
      'double',
      'pointer'
    ],
    [
      'What xml version number is declared at the very beginning of every xml file?',
      '2.0',
      '1.0',
      '3.0',
      '1.6',
      '1.0'
    ],
    [
      'Which of the following is NOT an attribute of TextView?',
      'text',
      'textSize',
      'textAlignment',
      'shape',
      'shape'
    ],
    [
      'What is the correct way to insert inline comments?',
      '// ...comment',
      '# ...comment',
      '<! ...comment',
      '/* ...comment',
      '// ...comment'
    ],
    [
      'A loop inside the body of another loop is called _____',
      'Nested',
      'Loop-in-loop',
      'Loop inception',
      'Double loops',
      'Nested'
    ],
    [
      'What keyword is used to create an instance of class?',
      'create',
      'new',
      'get',
      'return',
      'new'
    ],
    [
      'What type of argument does the startActivity() method take?',
      'Intent',
      'Integer',
      'View',
      'String',
      'Intent'
    ],
  ];

  QuestionBank() {
    _questionsList = [];
    for (var s in _questionsAndAnswers) {
      List<String> answers = [];
      answers.add(s[1]);
      answers.add(s[2]);
      answers.add(s[3]);
      answers.add(s[4]);
      String correctAnswer = s[5];
      _questionsList.add(new Question(s[0], answers, correctAnswer));
    }
  }

  List<Question> get questionsList => _questionsList;
}
