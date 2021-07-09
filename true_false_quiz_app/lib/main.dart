import 'package:flutter/material.dart';
import 'package:quiz_app/test_data.dart';
import 'package:quiz_app/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: QuestionPage(),
          ),
        ),
      ),
    );
  }
}

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  TestData test1 = TestData();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Center(
            child: Text(
              test1.getQuestion(),
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Wrap(
          runSpacing: 2,
          spacing: 2,
          children: test1.answerKey,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        buttonFunction(false);
                      },
                      child: Icon(Icons.thumb_down),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(50, 50),
                        primary: Colors.red,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        buttonFunction(true);
                      },
                      child: Icon(Icons.thumb_up),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(50, 50),
                        primary: Colors.green,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void buttonFunction(bool choosenIcon) {
    if (test1.isEnd() == true) {
      trueFalseControl(choosenIcon);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("END"),
            content: new Text("You have finished the test."),
            actions: <Widget>[
              new TextButton(
                child: new Text("Try again"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    test1.restartTest();
                    test1.answerKey = [];
                  });
                },
              ),
            ],
          );
        },
      );
    } else {trueFalseControl(choosenIcon);}
  }
  void trueFalseControl(bool choosenIcon) {
    setState(
      () {
        test1.getAnswer() == choosenIcon
            ? test1.answerKey.add(kTrueIcon)
            : test1.answerKey.add(kFalseIcon);
        test1.nextQuestion();
      },
    );
  }
}
