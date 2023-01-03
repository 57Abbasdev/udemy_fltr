import 'package:udemy_fltr/by_angela/quiz/question.dart';

class QuizBrain {
  int _qNo = 0;
  bool isEndList = false;
  final List<Question> _questionBank = [
    Question(
        ques: 'You can lead a cow down stairs but not up stairs.', qAns: true),
    Question(
        ques: 'Approximately one quarter of human bones are in the feet.',
        qAns: false),
    Question(ques: 'A slug\'s blood is green.', qAns: false),
    Question(
        ques: 'You can lead a cow down stairs but not up stairs.', qAns: true),
    Question(
        ques: 'Approximately one quarter of human bones are in the feet.',
        qAns: false),
    Question(ques: 'A slug\'s blood is green.', qAns: false),
    Question(
        ques: 'You can lead a cow down stairs but not up stairs.', qAns: true),
  ];

  String getQuestionText() {
    return _questionBank[_qNo].ques;
  }

  bool getAnswer() {
    return _questionBank[_qNo].qAns;
  }

  void nextQuestion() {
    if (_qNo < _questionBank.length - 1) {
      _qNo++;
      print(_qNo);
    }
    if (_qNo == _questionBank.length) {
      print("=  $_qNo");
    }
    print(_qNo);
  }

  bool isFinished() {
    //when display 6 question, and above if not work, now we - the list length to get the last answer result and show the alert.
    if (_qNo >= _questionBank.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _qNo = 0;
  }
}
