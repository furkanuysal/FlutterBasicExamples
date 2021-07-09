import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int imageNo1 = 1;
  int imageNo2 = 2;
  int imageNo3 = 3;

  void changePicture() {
    imageNo1 = Random().nextInt(5) + 1;
    imageNo2 = Random().nextInt(5) + 1;
    imageNo3 = Random().nextInt(5) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text('Space Pics'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: buildImage(imageNo1.toString()),
            ),
            Expanded(
              child: buildImage(imageNo2.toString())
            ),
            Expanded(
              child: buildImage(imageNo3.toString())
            ),
            Card(
              color: Colors.indigo,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: ListTile(
                leading: Icon(Icons.arrow_forward, color: Colors.white),
                title: Text(
                  'Change Pictures',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  setState(
                    () {
                      changePicture();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildImage(String imageNo) {
    return Container(
              child: Image.asset('assets/images/space_$imageNo.jpg'),
            );
  }
}
