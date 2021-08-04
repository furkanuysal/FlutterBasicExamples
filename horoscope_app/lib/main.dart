import 'package:flutter/material.dart';
import 'package:horoscope_app/pages/horoscope_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: HoroscopeList(),
    );
  }
}
