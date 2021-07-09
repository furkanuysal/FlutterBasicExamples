import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/MyWidgets.dart';
import 'package:life_expectancy/resultPage.dart';
import 'package:life_expectancy/user_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LifeExpectancyPage(),
    );
  }
}

class LifeExpectancyPage extends StatefulWidget {
  const LifeExpectancyPage({Key? key}) : super(key: key);

  @override
  _LifeExpectancyPageState createState() => _LifeExpectancyPageState();
}

class _LifeExpectancyPageState extends State<LifeExpectancyPage> {
  String? chosenSex;
  double smokedCigarette = 0;
  double dayNumber = 0;
  double height = 170;
  double weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Life Expectancy'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainerWidget(
                    child: PlusMinusWidget(
                      text: 'HEIGHT',
                      number: height,
                      onPressMinus: () {
                        setState(
                          () {
                            height--;
                          },
                        );
                      },
                      onPressPlus: () {
                        setState(() {
                          height++;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainerWidget(
                    child: PlusMinusWidget(
                      text: 'WEIGHT',
                      number: weight,
                      onPressMinus: () {
                        setState(
                          () {
                            weight--;
                          },
                        );
                      },
                      onPressPlus: () {
                        setState(() {
                          weight++;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainerWidget(
                    child: SliderTextColumn(
                      divisions: 7,
                      max: 7,
                      number: dayNumber,
                      text: 'How many days a week do you exercise?',
                      onChanged: (double newValue) {
                        setState(
                          () {
                            dayNumber = newValue;
                          },
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainerWidget(
                    child: SliderTextColumn(
                      max: 30,
                      text: 'How many cigarettes do you smoke per day?',
                      number: smokedCigarette,
                      onChanged: (double newValue) {
                        setState(
                          () {
                            smokedCigarette = newValue;
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainerWidget(
                      onPress: () {
                        chooseSexButton('FEMALE');
                      },
                      onDoublePress: () {
                        chooseSexButton('');
                      },
                      myColor: chosenSex == 'FEMALE'
                          ? Colors.blueGrey
                          : Colors.white,
                      child: SexIcon(
                        icon: FontAwesomeIcons.venus,
                        sex: 'FEMALE',
                      )),
                ),
                Expanded(
                  child: MyContainerWidget(
                    onPress: () {
                      chooseSexButton('MALE');
                    },
                    onDoublePress: () {
                      chooseSexButton('');
                    },
                    myColor:
                        chosenSex == 'MALE' ? Colors.blueGrey : Colors.white,
                    child: SexIcon(
                      icon: FontAwesomeIcons.mars,
                      sex: 'MALE',
                    ),
                  ),
                )
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    UserData(
                        chosenSex: chosenSex,
                        height: height,
                        smokedCigarette: smokedCigarette,
                        weight: weight,
                        dayNumber: dayNumber),
                  ),
                ),
              );
            },
            child: Text(
              'Calculate',
              style: TextStyle(color: Colors.black54),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: Size(60, 60),
            ),
          )
        ],
      ),
    );
  }

  void chooseSexButton(String text) {
    setState(() {
      chosenSex = text;
    });
  }
}
