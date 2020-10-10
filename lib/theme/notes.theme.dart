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
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: kPrimary,
        ),
        borderRadius: BorderRadius.circular(8.0),
        gapPadding: 4.0,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: kBaseTextColorLight,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
  );
}
