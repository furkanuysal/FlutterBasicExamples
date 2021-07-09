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
  final player = AudioCache();
  void playSound(String voice) {
    player.play('$voice.wav');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: buildTextButton(Colors.amberAccent, 'bip'),
                ),
                Expanded(
                  child: buildTextButton(Colors.blue,'bongo'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: buildTextButton(Colors.purpleAccent,'clap1'),
                ),
                Expanded(
                  child: buildTextButton(Colors.green,'clap2'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: buildTextButton(Colors.deepOrangeAccent,'clap3'),
                ),
                Expanded(
                  child: buildTextButton(Colors.deepPurpleAccent,'crash'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: buildTextButton(Colors.red,'how'),
                ),
                Expanded(
                  child: buildTextButton(Colors.lightGreenAccent,'oobah'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: buildTextButton(Colors.indigoAccent,'ridebel'),
                ),
                Expanded(
                  child: buildTextButton(Colors.pink,'woo'),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
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
