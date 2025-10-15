import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_list/constants/constants.dart';
import 'package:note_list/helpers/database_helper.dart';
import 'package:note_list/pages/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dbHelper = DatabaseHelper();
    dbHelper.getCategories();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme),
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Constants.primarySwatch)
                .copyWith(secondary: Constants.secondaryColor),
      ),
      home: NotePad(),
    );
  }
}
