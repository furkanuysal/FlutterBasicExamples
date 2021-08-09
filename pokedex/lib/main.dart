import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/pages/pokemon_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.title,
      theme: ThemeData(
          primarySwatch: Constants.appColor,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: PokemonList(),
    );
  }
}
