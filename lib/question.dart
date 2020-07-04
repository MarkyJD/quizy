class Question {
  String _question;
  List<String> _answers;
  String _correctAnswer;

  Question(String _question, List<String> _answers, String _correctAnswer) {
    this._question = _question;
    this._answers = _answers;
    this._correctAnswer = _correctAnswer;
  }

  String get question => _question;
  List<String> get answers => _answers;
  String get correctAnswer => _correctAnswer;

  bool isAnswerCorrect(String answer) {
    return answer.compareTo(_correctAnswer) == 0 ? true : false;
  }
}
