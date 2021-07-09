import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent[100],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  radius: 75.0,
                  backgroundColor: Colors.lightBlueAccent,
                  backgroundImage: AssetImage('assets/images/youtubeLogo.jpg'),
                ),
                Text(
                  'Youtube Premium',
                  style: TextStyle(
                      fontFamily: 'Yellowtail',
                      fontSize: 40,
                      color: Colors.white),
                ),
                Text(
                  'Watch videos unlimited.',
                  style: TextStyle(
                      fontFamily: 'Big Shoulders Display',
                      fontSize: 35,
                      color: Colors.white70),
                ),
                SizedBox(height: 5.0,),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 33.0),
                  color: Colors.red[900],
                  child: ListTile(
                    leading: Icon(Icons.chat, size: 35, color: Colors.white),
                    title: Text(
                      'contact@youtube.com',
                      style: GoogleFonts.teko(
                        textStyle: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 33.0),
                  color: Colors.red[900],
                  child: ListTile(
                    leading:
                        Icon(Icons.call_made, size: 35, color: Colors.white),
                    title: Text(
                      ' +1 650-253-0001',
                      style: GoogleFonts.teko(
                        textStyle: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
