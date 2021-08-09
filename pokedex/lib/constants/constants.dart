import 'package:flutter/material.dart';

class Constants {
  static final Text titleName = Text(
    'Pokedex',
    style: titleStyle,
  );
  static final String title = 'Pokedex';
  static const appColor = Colors.red;
  static final String placeholder = 'assets/images/loading.gif';
  static final textStyle = TextStyle(
      fontFamily: 'Pokemon',
      color: Colors.yellow[800],
      fontSize: 19,
      letterSpacing: 1);
  static final titleStyle = TextStyle(
      fontFamily: 'Pokemon',
      color: Colors.yellow,
      fontSize: 24,
      letterSpacing: 1);
  static final textTitleStyle = TextStyle(
      fontFamily: 'Pokemon',
      color: Colors.black,
      fontSize: 16,
      letterSpacing: 1);

  static typeColor(String type) {
    switch (type) {
      case "Grass":
        return Colors.greenAccent;
      case "Poison":
        return Colors.purple;
      case "Fire":
        return Colors.red;
      case "Water":
        return Colors.blue;
      case "Flying":
        return Colors.brown[200];
      case "Normal":
        return Colors.white;
      case "Electric":
        return Colors.yellow;
      case "Ground":
        return Colors.brown;
      case "Bug":
        return Colors.pink[100];
      case "Psychic":
        return Colors.yellowAccent[100];
      case "Fighting":
        return Colors.teal;
      case "Rock":
        return Colors.blueGrey[200];
      case "Ice":
        return Colors.lightBlue[200];
      case "Ghost":
        return Colors.black;
      case "Dragon":
        return Colors.red[900];
      case "Fairy":
        return Colors.pink[400];
    }
  }

  static typeLabelStyle(String type) {
    switch (type) {
      case "Grass":
        return TextStyle(color: Colors.black);
      case "Poison":
        return TextStyle(color: Colors.white);
      case "Fire":
        return TextStyle(color: Colors.white);
      case "Water":
        return TextStyle(color: Colors.white);
      case "Flying":
        return TextStyle(color: Colors.black);
      case "Normal":
        return TextStyle(color: Colors.black);
      case "Electric":
        return TextStyle(color: Colors.black);
      case "Ground":
        return TextStyle(color: Colors.white);
      case "Bug":
        return TextStyle(color: Colors.black);
      case "Psychic":
        return TextStyle(color: Colors.black);
      case "Fighting":
        return TextStyle(color: Colors.white);
      case "Rock":
        return TextStyle(color: Colors.black);
      case "Ice":
        return TextStyle(color: Colors.black);
      case "Ghost":
        return TextStyle(color: Colors.white);
      case "Dragon":
        return TextStyle(color: Colors.white);
      case "Fairy":
        return TextStyle(color: Colors.white);
    }
  }
}
