import 'package:cgpa_calculator/constants/constants.dart';
import 'package:cgpa_calculator/helpers/data_helper.dart';
import 'package:cgpa_calculator/models/lecture.dart';
import 'package:cgpa_calculator/widgets/average.dart';
import 'package:cgpa_calculator/widgets/dropdowns.dart';
import 'package:cgpa_calculator/widgets/lecture_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var formKey = GlobalKey<FormState>();
  double chosenCreditValue = 2;
  double chosenLetterValue = 4;
  String lectureNameValue = '';
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          Constants.appTitle,
          style: Constants.titleStyle,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: ShowAverage(
                  average: DataHelper.calculateAverage(),
                  lectureNum: DataHelper.allLectures.length,
                ),
              )
            ],
          ),
          Expanded(child: LectureList(
            onDismiss: (index) {
              DataHelper.allLectures.removeAt(index);
              setState(() {});
            },
          ))
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: Constants.childPadding,
              child: _buildTextFormField(),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: Constants.childPadding,
                    child: LetterDropDown(
                      onChosenLetter: (value) {
                        chosenLetterValue = value;
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: Constants.childPadding,
                    child: CreditDropDown(
                      onChosenCredit: (value) {
                        chosenCreditValue = value;
                      },
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _calculateAverage,
                  icon: Icon(Icons.arrow_forward_ios_sharp,
                      color: Constants.appColor, size: 30),
                ),
              ],
            ),
            SizedBox(height: 5),
          ],
        ));
  }

  Widget _buildTextFormField() {
    return TextFormField(
      onSaved: (value) {
        setState(() {
          lectureNameValue = value!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return 'Please enter lecture name';
        } else
          return null;
      },
      decoration: InputDecoration(
        hintText: 'Calculus',
        border: OutlineInputBorder(
            borderRadius: Constants.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Constants.appColor.shade100.withOpacity(0.3),
      ),
    );
  }

  Future<void> _calculateAverage() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var newLecture = Lecture(
          name: lectureNameValue,
          letterNoteValue: chosenLetterValue,
          credit: chosenCreditValue);
      DataHelper.addLecture(newLecture);
      setState(() {});
    }
  }
}
