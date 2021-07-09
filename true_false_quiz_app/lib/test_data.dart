import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';

class TestData {
  int _questionIndex = 0;

  List<Question> questions = [
    Question(question: 'Is one dozen equal to 12?', answer: true),
    Question(question: 'Is New York capital of the USA?', answer: false),
    Question(question: 'Is Thomas Edison discovered gravity?', answer: false),
    Question(
        question: 'A lion' 's roar can be heard up to eight kilometres away.',
        answer: true),
    Question(question: 'An octopus has three hearts.', answer: true),
    Question(
        question: 'Venus is the hottest planet in the solar system.',
        answer: true),
    Question(
        question: 'In Harry Potter, Draco Malfoy has no siblings.',
        answer: false),
  ];

  String getQuestion() {
    return questions[_questionIndex].question;
  }

  bool getAnswer() {
    return questions[_questionIndex].answer;
  }

  void nextQuestion() {
    if (_questionIndex + 1 < questions.length) {
      _questionIndex++;
    }
  }

  bool isEnd() {
    if (_questionIndex + 1 >= questions.length)
      return true;
    else
      return false;
  }

  void restartTest() {
    _questionIndex = 0;
  }
  List<Widget> answerKey = [];

}
