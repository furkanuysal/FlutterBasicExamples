import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AustriaFlag extends StatelessWidget {
  static String routeName = '/austria';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Austria Flag'),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              height: 200,
              width: 300,
              color: Color(0xffdc0000),
            ),
            Positioned(
              top: 66.6,
              child: Container(
                height: 66.6,
                width: 300,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}


class BelgiumFlag extends StatelessWidget {
  static String routeName = '/belgium';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Belgium Flag'),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              height: 200,
              width: 300,
              color: Color(0xffef3340),
            ),
            Positioned(
              left: 100,
              child: Container(
                height: 200,
                width: 100,
                color: Color(0xfffdda25),
              ),
            ),
             Positioned(
              left: 0,
              child: Container(
                height: 200,
                width: 100,
                color: Color(0xff000000),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class FranceFlag extends StatelessWidget {
  static String routeName = '/france';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('France Flag'),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              height: 200,
              width: 300,
              color: Color(0xffed2939),
            ),
            Positioned(
              left: 100,
              child: Container(
                height: 200,
                width: 100,
                color: Colors.white,
              ),
            ),
             Positioned(
              left: 0,
              child: Container(
                height: 200,
                width: 100,
                color: Color(0xff002395),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class JapanFlag extends StatelessWidget {
  static String routeName = '/japan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Japan Flag'),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              height: 200,
              width: 300,
              color: Colors.white,
            ),
            Positioned(
              left: 87.5,
              top: 35,
              child: Icon(FontAwesomeIcons.solidCircle, color: Color(0xffbc002d), size: 125, ),
            ),
          ],
        ),
      ),
    );
  }
}


class SwitzerlandFlag extends StatelessWidget {
  static String routeName = '/switzerland';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switzerland Flag'),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              height: 200,
              width: 300,
              color: Color(0xffff0000),
            ),
            Positioned(
              left: 75,
              top: 20,
              child: Icon(FontAwesomeIcons.plus, color: Colors.white, size: 150, ),
            ),
          ],
        ),
      ),
    );
  }
}


class CameroonFlag extends StatelessWidget {
  static String routeName = '/cameroon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cameroon Flag'),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              height: 200,
              width: 300,
              color: Color(0xfffcd116),
            ),
            Positioned(
              left: 100,
              child: Container(
                height: 200,
                width: 100,
                color: Color(0xffce1126),
              ),
            ),
             Positioned(
              left: 0,
              child: Container(
                height: 200,
                width: 100,
                color: Color(0xff007a5e),
              ),
            ),
            Positioned(
              left: 112.5,
              top: 60,
              child: Icon(Icons.star, color: Color(0xfffcd116), size: 75, ),
            ),
          ],
        ),
      ),
    );
  }
}


class PanamaFlag extends StatelessWidget {
  static String routeName = '/panama';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panama Flag'),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              height: 200,
              width: 300,
              color: Colors.white,
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                height: 100,
                width: 150,
                color: Color(0xff072357),
              ),
            ),
             Positioned(
              right: 0,
              top: 0,
              child: Container(
                height: 100,
                width: 150,
                color: Color(0xffda121a),
              ),
            ),
            Positioned(
              left: 45,
              top: 20,
              child: Icon(Icons.star, color: Color(0xfff072357), size: 60, ),
            ),
            Positioned(
              right: 45,
              bottom: 20,
              child: Icon(Icons.star, color: Color(0xffda121a), size: 60, ),
            ),
          ],
        ),
      ),
    );
  }
}
