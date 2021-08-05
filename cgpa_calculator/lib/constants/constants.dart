import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const appColor = Colors.deepPurple;
  static const String appTitle = 'CGPA Calculator';
  static final TextStyle titleStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: appColor);

  static BorderRadius borderRadius = BorderRadius.circular(24);
  static BorderRadius buttonBorderRadius = BorderRadius.circular(12);

  static final TextStyle lectureStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: appColor);

  static final TextStyle averageStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w800, color: appColor);

  static final dropDownPadding =
      EdgeInsets.symmetric(horizontal: 12, vertical: 8);

  static final childPadding = EdgeInsets.symmetric(horizontal: 8.0);
}
