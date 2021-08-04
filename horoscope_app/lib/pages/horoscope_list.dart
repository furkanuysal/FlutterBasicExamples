import 'package:flutter/material.dart';
import 'package:horoscope_app/helpers/strings.dart';
import 'package:horoscope_app/models/horoscope.dart';
import 'package:horoscope_app/widgets/horoscope_card.dart';

class HoroscopeList extends StatelessWidget {
  late final List<Horoscope> allHoroscopes;

  HoroscopeList() {
    allHoroscopes = callHoroscopeData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horoscope List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return HoroscopeCard(
            listedHoroscope: allHoroscopes[index],
          );
        },
        itemCount: allHoroscopes.length,
      ),
    );
  }

  List<Horoscope> callHoroscopeData() {
    List<Horoscope> gecici = [];
    for (var i = 0; i < 12; i++) {
      var horName = Strings.BURC_ADLARI[i];
      var horDate = Strings.BURC_TARIHLERI[i];
      var horDesc = Strings.BURC_GENEL_OZELLIKLERI[i];
      var horMini = Strings.BURC_ADLARI[i].toLowerCase() + '${i+1}.png';
      var horBig = Strings.BURC_ADLARI[i].toLowerCase() + '_buyuk${i+1}.png';
      Horoscope horoscope =
          Horoscope(horName, horDate, horDesc, horMini, horBig);
      gecici.add(horoscope);
    }
    return gecici;
  }
}
