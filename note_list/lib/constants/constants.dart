import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static Text title = Text("NotePad", style: titleTextStyle);
  static final titleTextStyle =
      GoogleFonts.quicksand(fontWeight: FontWeight.w900, color: Colors.white);
  static const primarySwatch = Colors.deepPurple;
  static Color secondaryColor = Colors.deepPurple[300] as Color;
  static const cancelButtonColor = Colors.red;
  static final textStyleProp = GoogleFonts.quicksand(
      fontSize: 18, fontWeight: FontWeight.w900, color: primarySwatch);
  static final textStyleNormal = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w800, color: primarySwatch);
  static final textStyleDesc = GoogleFonts.quicksand(
      fontSize: 18, fontWeight: FontWeight.w800, color: Colors.black);
  static final priorityStyle = TextStyle(color: Colors.white);
  static final highPriorityStyle = TextStyle(color: primarySwatch);
  static final textWhiteStyle = TextStyle(color: Colors.white);
}
