import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DrumApp());
}

class DrumApp extends StatelessWidget {
  const DrumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: DrumMachine(),
      ),
    );
  }
}

class DrumMachine extends StatelessWidget {
  final drumButtons = [
    [Colors.amberAccent, 'bip', Colors.blue, 'bongo'],
    [Colors.purpleAccent, 'clap1', Colors.green, 'clap2'],
    [Colors.deepOrangeAccent, 'clap3', Colors.deepPurpleAccent, 'crash'],
    [Colors.red, 'how', Colors.lightGreenAccent, 'oobah'],
    [Colors.indigoAccent, 'ridebel', Colors.pink, 'woo'],
  ];

  final player = AudioPlayer();
  void playSound(String voice) async {
    await player.play(AssetSource('$voice.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: drumButtons.map((pair) => buildDrumRow(pair)).toList(),
      ),
    ));
  }

  Widget buildDrumRow(List<dynamic> pair) {
    return Expanded(
      child: Row(
        children: [
          Expanded(child: buildTextButton(pair[0] as Color, pair[1] as String)),
          Expanded(child: buildTextButton(pair[2] as Color, pair[3] as String)),
        ],
      ),
    );
  }

  TextButton buildTextButton(Color color, String voice) {
    return TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.all(8)),
        child: Container(color: color),
        onPressed: () {
          playSound(voice);
        });
  }
}
