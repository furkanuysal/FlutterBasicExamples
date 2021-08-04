import 'package:flutter/material.dart';
import 'package:horoscope_app/models/horoscope.dart';
import 'package:horoscope_app/pages/horoscope_detail.dart';

class HoroscopeCard extends StatelessWidget {
  final Horoscope listedHoroscope;
  const HoroscopeCard({required this.listedHoroscope, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HoroscopeDetailPage(
                      chosenHor: listedHoroscope,
                    )));
          },
          leading: Hero(tag: listedHoroscope,
            child: Image.asset(
              'assets/images/' + listedHoroscope.miniPic,
              width: 64,
              height: 64,
            ),
          ),
          title: Text(
            listedHoroscope.name,
            style: myTextStyle.headline6,
          ),
          subtitle: Text(
            listedHoroscope.date,
            style: myTextStyle.bodyText2,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
