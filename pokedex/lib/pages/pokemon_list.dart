import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pokedex/apis/api.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/models/pokedex.dart';
import 'package:pokedex/pages/pokemon_detail.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Pokedex pokedex;
  late Future<Pokedex> data;

  Future<Pokedex> getPokemons() async {
    var response = await Api.getPokemons();
    var decodedJson = json.decode(response.body);
    pokedex = Pokedex.fromJson(decodedJson);
    return pokedex;
  }

  @override
  void initState() {
    super.initState();
    data = getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Constants.titleName,
        centerTitle: true,
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return gridListPortrait(2);
        } else {
          return gridListPortrait(4);
        }
      }),
    );
  }

  FutureBuilder<Pokedex> gridListPortrait(int count) {
    return FutureBuilder(
      future: data,
      builder: (context, AsyncSnapshot<Pokedex> pokedexCome) {
        if (pokedexCome.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return GridView.count(
            crossAxisCount: count,
            children: pokedexCome.data!.pokemon.map((poke) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PokemonDetailPage(
                            pokemon: poke,
                          )));
                },
                child: Card(
                  color: Colors.red.shade50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Hero(
                          tag: poke.img!,
                          child: FadeInImage.assetNetwork(
                            placeholderScale: 5,
                            placeholder: Constants.placeholder,
                            image: poke.img!,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          poke.name!,
                          style: Constants.textStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}
