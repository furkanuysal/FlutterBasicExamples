import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/models/pokedex.dart';

class PokemonDetailPage extends StatefulWidget {
  PokemonDetailPage({required this.pokemon, Key? key}) : super(key: key);
  final Pokemon pokemon;

  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  Color backColor = Colors.transparent;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    generateAppBarColor();
  }

  void generateAppBarColor() async {
    _generator = await PaletteGenerator.fromImageProvider(
        NetworkImage(widget.pokemon.img!));
    backColor = _generator.dominantColor!.color;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.pokemon.name!,
          style: Constants.titleStyle,
        ),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return portraitBody(context);
        } else {
          return landscapeBody(context);
        }
      }),
    );
  }

  Widget portraitBody(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          height: MediaQuery.of(context).size.height * (3 / 4),
          width: MediaQuery.of(context).size.width - 20,
          top: MediaQuery.of(context).size.height * 0.1,
          left: MediaQuery.of(context).size.width * 0.025,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 6,
            color: Colors.red.shade50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 65),
                Text(
                  widget.pokemon.name!,
                  style: Constants.textStyle,
                ),
                Text("Height: " + widget.pokemon.height!),
                Text("Weight: " + widget.pokemon.weight!),
                Text('Types', style: Constants.textTitleStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.pokemon.type!
                      .map((type) => Chip(
                          backgroundColor: Constants.typeColor(type),
                          labelStyle: Constants.typeLabelStyle(type),
                          label: Text(type)))
                      .toList(),
                ),
                Text('Pre Evolution', style: Constants.textTitleStyle),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.prevEvolution != null
                        ? widget.pokemon.prevEvolution!
                            .map((evo) => Chip(
                                  label: Text(evo.name!),
                                  backgroundColor: backColor,
                                ))
                            .toList()
                        : [Chip(label: Text('First Form'))]),
                Text('Next Evolution', style: Constants.textTitleStyle),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.nextEvolution != null
                        ? widget.pokemon.nextEvolution!
                            .map((evo) => Chip(
                                  label: Text(evo.name!),
                                  backgroundColor: backColor,
                                ))
                            .toList()
                        : [Chip(label: Text('Last Form'))]),
                Text('Weakness', style: Constants.textTitleStyle),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.weaknesses != null
                        ? widget.pokemon.weaknesses!
                            .map((weak) => Chip(
                                  label: Text(weak),
                                  backgroundColor: Constants.typeColor(weak),
                                  labelStyle: Constants.typeLabelStyle(weak),
                                ))
                            .toList()
                        : [Chip(label: Text('There is no weakness.'))])
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: widget.pokemon.img!,
            child: Image.network(widget.pokemon.img!, scale: 0.7),
          ),
        )
      ],
    );
  }

  Widget landscapeBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height * (3 / 4),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.red.shade50),
      child: Row(
        children: [
          Column(children: [
            Hero(
              tag: widget.pokemon.img!,
              child: Image.network(widget.pokemon.img!, scale: 0.7),
            ),
            Text(widget.pokemon.name!, style: Constants.textStyle),
            SizedBox(height: 20),
            Text("Height: " + widget.pokemon.height!),
            Text("Weight: " + widget.pokemon.weight!),
          ]),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Types', style: Constants.textTitleStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.pokemon.type!
                      .map((type) => Chip(
                          backgroundColor: Constants.typeColor(type),
                          labelStyle: Constants.typeLabelStyle(type),
                          label: Text(type)))
                      .toList(),
                ),
                Text('Pre Evolution', style: Constants.textTitleStyle),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.prevEvolution != null
                        ? widget.pokemon.prevEvolution!
                            .map((evo) => Chip(
                                  label: Text(evo.name!),
                                  backgroundColor: backColor,
                                ))
                            .toList()
                        : [Chip(label: Text('First Form'))]),
                Text('Next Evolution', style: Constants.textTitleStyle),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.nextEvolution != null
                        ? widget.pokemon.nextEvolution!
                            .map((evo) => Chip(
                                  label: Text(evo.name!),
                                  backgroundColor: backColor,
                                ))
                            .toList()
                        : [Chip(label: Text('Last Form'))]),
                Text('Weakness', style: Constants.textTitleStyle),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.weaknesses != null
                        ? widget.pokemon.weaknesses!
                            .map((weak) => Chip(
                                  label: Text(weak),
                                  backgroundColor: Constants.typeColor(weak),
                                  labelStyle: Constants.typeLabelStyle(weak),
                                ))
                            .toList()
                        : [Chip(label: Text('There is no weakness.'))])
              ],
            ),
          )
        ],
      ),
    );
  }
}
