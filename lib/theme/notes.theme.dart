import 'package:flutter/material.dart';
import 'package:flutter_notes/utils/constants.dart';

final ThemeData notesTheme = buildNotesTheme();
const Color kPrimary = Color(0xfff45d48);

ThemeData buildNotesTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    scaffoldBackgroundColor: kBGColor,
    primaryColor: kPrimary,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      labelStyle: kPlaceHolderStyle,
      focusedBorder: getOutlineInputBorder(8.0).copyWith(
        gapPadding: 4.0,
      ),
      errorBorder: getOutlineInputBorder(20.0).copyWith(
        borderSide: BorderSide(
          color: kPrimary,
        ),
      ),
      focusedErrorBorder: getOutlineInputBorder(20.0).copyWith(
        borderSide: BorderSide(
          color: kPrimary,
          width: 2,
        ),
      ),
      enabledBorder: getOutlineInputBorder(20.0),
    ),
  );
}

OutlineInputBorder getOutlineInputBorder(double radius) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: kBaseTextColorLight,
    ),
    borderRadius: BorderRadius.circular(radius),
  );
}
