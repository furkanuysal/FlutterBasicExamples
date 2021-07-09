import 'package:flutter/material.dart';
import 'package:life_expectancy/user_data.dart';
import 'package:life_expectancy/calculation.dart';

class ResultPage extends StatelessWidget {
  final UserData userData;
  ResultPage(this.userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Life Expectancy Results'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 15,
            child: Center(
              child: Text('Your results: ${Calculator(userData).calculate().toInt().toString()}'),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'BACK',
                style: TextStyle(color: Colors.black54),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(30, 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
