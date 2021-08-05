import 'package:cgpa_calculator/constants/constants.dart';
import 'package:flutter/material.dart';

class ShowAverage extends StatelessWidget {
  final double average;
  final int lectureNum;
  const ShowAverage({required this.average, required this.lectureNum, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          lectureNum > 0 ? 'Total Lecture: $lectureNum' : 'Add Lecture',
          style: Constants.lectureStyle,
        ),
        Text(
          average > 0 ? average.toStringAsFixed(2) : '0.00',
          style: Constants.averageStyle,
        ),
        Text('Average',style: Constants.lectureStyle,),
      ],
    );
  }
}
