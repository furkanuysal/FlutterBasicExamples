import 'package:flutter/material.dart';

void main() {
  runApp(ColumnRow());
}

class ColumnRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 75,
              color: Colors.cyanAccent,
              child: Text(
                'Cyan Container',
                textAlign: TextAlign.center,
                style: (TextStyle(
                  fontSize: 50,
                  fontFamily: 'Indie Flower',
                  color: Colors.red[900],
                )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 75,
                  width: 150,
                  color: Colors.lime,
                  child: Text(
                    'Lime Container',
                    style: TextStyle(
                        fontFamily: 'Indie Flower',
                        fontSize: 30,
                        color: Colors.indigo[900]),
                  ),
                ),
                Container(
                  height: 75,
                  width: 150,
                  color: Colors.amber,
                  child: Text(
                    'Amber Container',
                    style: TextStyle(
                        fontFamily: 'Indie Flower',
                        fontSize: 30,
                        color: Colors.indigo[900]),
                  ),
                ),
              ],
            ),
            Container(
              height: 75,
              color: Colors.indigoAccent,
              child: Text(
                'IndigoAccent Container',
                style: TextStyle(
                    fontFamily: 'Indie Flower',
                    fontSize: 40,
                    color: Colors.yellowAccent),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 75,
              color: Colors.red[900],
              child: Text(
                '--Font Name--',
                style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Indie Flower',
                    color: Colors.amber),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 175,
                  height: 75,
                  color: Colors.orange,
                  child: Text(
                    'Indie',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red[900],
                        fontFamily: 'Indie Flower',
                        fontSize: 50),
                  ),
                ),
                Container(
                  width: 175,
                  height: 75,
                  color: Colors.pink,
                  child: Text(
                    'Flower',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 50,
                        fontFamily: 'Indie Flower',
                        color: Colors.amberAccent),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
