import 'package:flutter/material.dart';
import 'flags.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        AustriaFlag.routeName: (context) => AustriaFlag(),
        FranceFlag.routeName: (context) => FranceFlag(),
        BelgiumFlag.routeName: (context) => BelgiumFlag(),
        SwitzerlandFlag.routeName: (context) => SwitzerlandFlag(),
        JapanFlag.routeName: (context) => JapanFlag(),
        CameroonFlag.routeName: (context) => CameroonFlag(),
        PanamaFlag.routeName: (context) => PanamaFlag(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flags with Stacks'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AustriaFlag.routeName);
                },
                child: Text(
                  'Austria',
                  style: TextStyle(fontSize: 20),
                ),
                style: TextButton.styleFrom(
                    primary: Colors.white, backgroundColor: Colors.red),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, BelgiumFlag.routeName);
                },
                child: Text(
                  'Belgium',
                  style: TextStyle(fontSize: 20),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.yellow, primary: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, FranceFlag.routeName);
                },
                child: Text(
                  'France',
                  style: TextStyle(fontSize: 20),
                ),
                style: TextButton.styleFrom(
                    primary: Colors.white, backgroundColor: Colors.blue[900]),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, SwitzerlandFlag.routeName);
                },
                child: Text(
                  'Switzerland',
                  style: TextStyle(fontSize: 20),
                ),
                style: TextButton.styleFrom(
                    primary: Colors.white, backgroundColor: Colors.red),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                onPressed: () {Navigator.pushNamed(context, JapanFlag.routeName);},
                child: Text(
                  'Japan',
                  style: TextStyle(fontSize: 20),
                ),
                style: TextButton.styleFrom(
                    primary: Colors.red, backgroundColor: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                onPressed: () {Navigator.pushNamed(context, CameroonFlag.routeName);},
                child: Text(
                  'Cameroon',
                  style: TextStyle(fontSize: 20),
                ),
                style: TextButton.styleFrom(
                    primary: Color(0xfffcd116), backgroundColor: Color(0xff007a5e)),
              ),
            ),
          ),  
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                onPressed: () {Navigator.pushNamed(context, PanamaFlag.routeName);},
                child: Text(
                  'Panama',
                  style: TextStyle(fontSize: 20),
                ),
                style: TextButton.styleFrom(
                    primary: Color(0xff072357), backgroundColor: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
