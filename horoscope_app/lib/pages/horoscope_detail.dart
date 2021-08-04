import 'package:flutter/material.dart';
import 'package:horoscope_app/models/horoscope.dart';
import 'package:palette_generator/palette_generator.dart';

class HoroscopeDetailPage extends StatefulWidget {
  final Horoscope chosenHor;
  const HoroscopeDetailPage({required this.chosenHor, Key? key})
      : super(key: key);

  @override
  _HoroscopeDetailPageState createState() => _HoroscopeDetailPageState();
}

class _HoroscopeDetailPageState extends State<HoroscopeDetailPage> {
  Color appBarColor = Colors.pink;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    generateAppBarColor();
  }

  void generateAppBarColor() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage('assets/images/' + widget.chosenHor.bigPic));
    appBarColor = _generator.dominantColor!.color;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: appBarColor,
            title: Text(widget.chosenHor.name + ' Burcu ve Özellikleri'),
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(tag: widget.chosenHor,
                child: Image.asset(
                  'assets/images/' + widget.chosenHor.bigPic,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Text(
                  widget.chosenHor.description,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
